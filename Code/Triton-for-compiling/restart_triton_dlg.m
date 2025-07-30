function restart_triton_dlg()
    q_msg = ['Warning, Triton needs to be restarted after modifying Remoras.' ...
             ' Restart now?'];
    choice = questdlg(q_msg, 'Restart Triton?', 'Yes', 'No', 'Yes');
    if strcmp(choice, 'Yes')
        triton;
    else
        disp_msg('Restart Triton manually to apply changes.');
    end
end
