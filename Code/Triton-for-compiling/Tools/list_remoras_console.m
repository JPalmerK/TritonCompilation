function list_remoras_console()
%LIST_REMORAS_CONSOLE  Print all installed remoras to the command window.
%   Scans the PARAMS.path.Remoras folder and lists each subdirectory.

    global PARAMS
    remDir = PARAMS.path.Remoras;
    if isempty(remDir) || ~isfolder(remDir)
        error('Remoras directory not found: %s', remDir);
    end

    d = dir(remDir);
    % Only directories, exclude . and ..
    isDir = [d.isdir];
    names = {d(isDir).name};
    names = setdiff(names, {'.','..'});

    if isempty(names)
        fprintf('No remoras installed in %s\n', remDir);
        return;
    end

    fprintf('Installed Remoras (found in %s):\n', remDir);
    for k = 1:numel(names)
        fprintf('  %d. %s\n', k, names{k});
    end
end
