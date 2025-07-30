function miscpd(action)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% miscpd.m
% Callback for Remora pulldown actions: add, remove, or list Remoras.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global PARAMS HANDLES DATA REMORA

RemoraConfFile = fullfile(PARAMS.path.Settings, 'InstalledRemoras.cnf');

switch action

    case 'add_remora'
        remPath = uigetdir('', 'Select the folder that contains your Remora');
        if remPath == 0
            return;
        end

        [path, folderName] = fileparts(remPath);
        original_rem = fullfile(path, folderName);
        remoraDir = fullfile(PARAMS.path.Remoras, folderName);

        if isequal(original_rem, remoraDir)
            disp_msg('Remora appears to already be in Remoras folder; skipping copy...');
        else
            try
                copyfile(original_rem, remoraDir);
            catch ME
                disp_msg(['Failed to copy Remora: ' ME.message]);
                return;
            end
        end

        % Check if already listed
        if exist(RemoraConfFile, 'file')
            cnf_txt = fileread(RemoraConfFile);
            if contains(cnf_txt, remoraDir)
                disp_msg(sprintf('Remora already listed in .cnf: %s', remoraDir));
                restart_triton_dlg();
                return;
            end
        end

        % Append to .cnf
        fid = fopen(RemoraConfFile, 'a+');
        fprintf(fid, '%s\n', remoraDir);
        fclose(fid);

        restart_triton_dlg();

    case 'rem_remora'
        dir1 = cd;
        cd(PARAMS.path.Remoras);
        removedRemDir = uigetdir(PARAMS.path.Remoras, 'Which Remora would you like to remove?');
        cd(dir1);

        if removedRemDir == 0
            return;
        end

        button = questdlg('Do you want to remove this Remora or back it up?',...
            'Remove Remora', 'Backup', 'Cancel', 'Remove');

        if strcmp(button, 'Remove') || strcmp(button, 'Backup')
            if strcmp(button, 'Backup')
                backUp = uigetdir('', 'Where do you want the backup?');
                if backUp == 0
                    return;
                end
                [~, name] = fileparts(removedRemDir);
                try
                    copyfile(fullfile(removedRemDir, '*'), fullfile(backUp, name), 'f');
                catch ME
                    disp_msg(['Backup failed: ' ME.message]);
                    return;
                end
            end

            try
                rmpath(genpath(removedRemDir));
                rmdir(removedRemDir, 's');
            catch ME
                disp_msg(['Remove failed: ' ME.message]);
                return;
            end

            % Remove from InstalledRemoras.cnf
            if exist(RemoraConfFile, 'file')
                fid = fopen(RemoraConfFile, 'r');
                remlist = textscan(fid, '%s', 'delimiter', '\n');
                fclose(fid);
                remlist = remlist{1};

                fod = fopen(RemoraConfFile, 'w');
                removed = false;
                for i = 1:length(remlist)
                    if strcmpi(strtrim(remlist{i}), strtrim(removedRemDir))
                        disp_msg(['Removed Remora from .cnf: ' removedRemDir]);
                        removed = true;
                    else
                        fprintf(fod, '%s\n', remlist{i});
                    end
                end
                fclose(fod);

                if ~removed
                    warndlg('Remora path was not found in .cnf file.');
                end
            end

            restart_triton_dlg();
        end

    case 'list_remoras'
        if exist(RemoraConfFile, 'file')
            fid = fopen(RemoraConfFile, 'r');
            remlist = textscan(fid, '%s', 'delimiter', '\n');
            fclose(fid);
            remlist = remlist{1};
            disp_msg('Installed Remoras:');
            cellfun(@disp_msg, remlist);
        else
            disp_msg('No InstalledRemoras.cnf file found.');
        end
end
end

function restart_triton_dlg()
    q_msg = ['Warning: Triton must be restarted for Remora changes to take effect.' ...
             newline 'Restart now?'];
    yes_msg = 'Yes';
    no_msg = 'No, restart manually later';
    try
        restart_button = questdlg(q_msg, 'Restart Triton?', yes_msg, no_msg, yes_msg);
    catch
        disp_msg('Restart Triton manually.');
        return;
    end

    if strcmp(restart_button, yes_msg)
        triton;
    else
        disp_msg('Restart Triton manually.');
    end
end
