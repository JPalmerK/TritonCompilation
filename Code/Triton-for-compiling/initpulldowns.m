function initpulldowns
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initpulldowns.m
% Generate figure pulldown menus for simplified Triton version
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global HANDLES PARAMS

% === File Menu ===
HANDLES.filemenu = uimenu(HANDLES.fig.ctrl,'Label','&File');
uimenu(HANDLES.filemenu,'Label','&Open LTSA File','Callback','filepd(''openltsa'')');
uimenu(HANDLES.filemenu,'Label','Open &XWAV File','Callback','filepd(''openxwav'')');
uimenu(HANDLES.filemenu,'Label','Open &WAV or FLAC File','Callback','filepd(''openwav'')');

% --- Export Submenu ---
HANDLES.exportdata = uimenu(HANDLES.filemenu, 'Separator','on','Label',...
    '&Export Plotted Data To','Enable','off');
uimenu(HANDLES.exportdata,'Label','&normalized WAV File','Callback','filepd(''export_normwav'')');
uimenu(HANDLES.exportdata,'Label','&WAV File','Callback','filepd(''export_wav'')');
uimenu(HANDLES.exportdata,'Label','&XWAV File','Callback','filepd(''export_xwav'')');
uimenu(HANDLES.exportdata,'Label','&MATLAB File *.mat','Callback', 'miscpd(''export_mat'')');

% --- Save Plot Submenu ---
HANDLES.savefig = uimenu(HANDLES.filemenu,'Label','Save Plot Window As','Enable','off');
uimenu(HANDLES.savefig,'Label','&JPEG File','Callback','filepd(''savejpg'')');
uimenu(HANDLES.savefig,'Label','&PDF File','Callback','filepd(''savepdf'')');
uimenu(HANDLES.savefig,'Label','MATLAB File *.fig','Callback','filepd(''savefigureas'')');

% --- Other File Options ---
HANDLES.exportparams = uimenu(HANDLES.filemenu, 'Label', '&Export PARAMS as MATLAB File *.mat',...
    'Callback', 'miscpd(''export_params'')');
HANDLES.saveimageas = uimenu(HANDLES.filemenu,'Label','Save Spectrogram As &Image',...
    'Visible','off','Enable','off','Callback','filepd(''saveimageas'')');
uimenu(HANDLES.filemenu,'Separator','on','Label','E&xit','Callback','filepd(''exit'')');

% === Settings Menu ===
HANDLES.setmenu = uimenu(HANDLES.fig.ctrl, 'Label', '&Settings');
uimenu(HANDLES.setmenu, 'Label', '&Save Current Window Positions','Callback', 'miscpd(''save_settings'')');
uimenu(HANDLES.setmenu, 'Label', '&Load Window Positions','Callback', 'miscpd(''load_settings'')');
uimenu(HANDLES.setmenu, 'Label', '&Set Current Window Positions for Startup','Callback', 'miscpd(''set_startup'')');
uimenu(HANDLES.setmenu, 'Label', '&Load Triton Default Window Positions','Callback', 'miscpd(''default_windows'')');
uimenu(HANDLES.setmenu,'Separator','on','Label', '&Save, Load, or Change Plot Parameters','Callback', 'miscpd(''plot_params'')');
uimenu(HANDLES.setmenu,'Label', '&Set Default Parameters','Callback', 'miscpd(''default_params'')');

% === Tools Menu ===
HANDLES.toolmenu = uimenu(HANDLES.fig.ctrl,'Label','&Tools','Enable','on');
uimenu(HANDLES.toolmenu,'Separator','on','Label','&Convert Single HARP Raw File to XWAV','Callback','toolpd(''convertfile'')');
uimenu(HANDLES.toolmenu,'Label','Load Transfer Function File','Enable','on','Callback','toolpd(''loadTF'')');

% --- Decimate Tools ---
HANDLES.decimenu = uimenu(HANDLES.toolmenu,'Label','Decimate XWAV/WAV Files');
uimenu(HANDLES.decimenu,'Label','&Decimate Single XWAV File','Enable','on','Callback','toolpd(''decimatefile'')');
uimenu(HANDLES.decimenu,'Label','&Decimate All XWAV Files in Directory','Enable','on','Callback','toolpd(''decimatefiledir'')');
uimenu(HANDLES.decimenu,'Separator','on','Label','&Decimate Single WAV or FLAC File','Enable','on','Callback','toolpd(''decimatewavfile'')');
uimenu(HANDLES.decimenu,'Label','&Decimate All WAV/FLAC Files in Directory','Enable','on','Callback','toolpd(''decimatewavfiledir'')');

uimenu(HANDLES.toolmenu,'Label','&Make LTSA from Directory of Files','Enable','on','Callback','toolpd(''mkltsa'')');

% === Remora Menu ===
HANDLES.remmenu = uimenu(HANDLES.fig.ctrl,'Label','&Remoras','Enable','on');

% --- Hardcoded Remora: Explosion Detector ---
HANDLES.explosionMenu = uimenu(HANDLES.remmenu, 'Label', 'Explosion Detector', 'Enable', 'on', 'Visible', 'on');
uimenu(HANDLES.explosionMenu, 'Label', 'Run Explosion Detector', 'Callback', 'ex_detect_pulldown');

% --- Hardcoded Remora: Fish Detector ---
HANDLES.fishMenu = uimenu(HANDLES.remmenu, 'Label', 'Fish Detector', 'Enable', 'on', 'Visible', 'on');
uimenu(HANDLES.fishMenu, 'Label', 'Run Fish Detector', 'Callback', 'pi_pulldown(''full_detector'')');

% --- Hardcoded Remora: Echo Detector ---
HANDLES.echodetMenu = uimenu(HANDLES.remmenu, 'Label', 'EchoDet', 'Enable', 'on', 'Visible', 'on');
uimenu(HANDLES.echodetMenu, 'Label', 'Run Echosounder Detector', 'Callback', 'run_echodet');
uimenu(HANDLES.echodetMenu, 'Label', 'Create ID File per Folder', 'Callback', 'run_echodet_idfiles');

% --- Hardcoded Remora: Air gun detector ---
REMORA.agDetect.menu = uimenu(HANDLES.remmenu,'Label','&Airgun Detector','Enable','on','Visible','on');
uimenu(REMORA.agDetect.menu, 'Label', 'Run Airgun Detector', 'Callback', 'ag_detect_pulldown');

% --- Hardcoded Remora: Label Vis ---
REMORA.lt.menu = uimenu(HANDLES.remmenu,'Label','&LabelVis',...
    'Enable','on','Visible','on');
%create tlab files from text
uimenu(REMORA.lt.menu, 'Label', 'Create tLabs from Text File',...
    'Callback','lt_pulldown(''create_tlabs_txt'')');
% create tlab files 
uimenu(REMORA.lt.menu, 'Label', 'Create tLabs from DetEdit Output', ...
    'Callback', 'lt_pulldown(''create_tlabs_detEdit'')');
% Start label visualization
uimenu(REMORA.lt.menu, 'Label', 'Visualize Labels', ...
    'Callback', 'lt_pulldown(''visualize_labels'')');
if ~isfield(REMORA,'fig')
    REMORA.fig = [];
end

% --- Hardcoded Remora: Cluster Tool ---
REMORA.ct.menu = uimenu(HANDLES.remmenu,'Label','&Cluster Tool',...
    'Enable','on','Visible','on');
% Run cluster bins
uimenu(REMORA.ct.menu, 'Label', 'Cluster Bins', ...
    'Callback', 'ct_pulldown(''cluster_bins'')');
% Run composite clusters
uimenu(REMORA.ct.menu, 'Label', 'Composite Clusters', ...
    'Callback', 'ct_pulldown(''composite_clusters'')');
uimenu(REMORA.ct.menu, 'Label', 'Post-Clustering Options', ...
    'Callback', 'ct_pulldown(''post_cluster'')');


% --- Hardcoded Remora: Soundscape Metrics ---
REMORA.sm.menu = uimenu(HANDLES.remmenu,'Label','&Soundscape Metrics',...
    'Enable','on','Visible','on');
% Make Soundscape LTSAs
uimenu(REMORA.sm.menu, 'Label', 'Make Soundscape LTSAs', ...
    'Enable','on','Callback', 'sm_pulldown(''make_ltsa'')');
% Compute soundscape metrics
uimenu(REMORA.sm.menu, 'Label', 'Compute Soundscape Metrics', ...
    'Callback', 'sm_pulldown(''compute_metrics'')');
% Load Soundscape LTSAs
uimenu(REMORA.sm.menu, 'Label', 'Load Soundscape LTSA', ...
    'Enable','on','Callback', 'sm_pulldown(''load_ltsa'')');
% Plot soundscape metrics
uimenu(REMORA.sm.menu, 'Label', 'Plot Soundscape Metrics', ...
    'Callback', 'sm_pulldown(''plot_metrics'')');

% --- Hardcoded Remora: Ship Detector ---
REMORA.sh.menu = uimenu(HANDLES.remmenu,'Label','&Ship-Detector',...
    'Enable','on','Visible','on');
% Interactive ltsa detector
uimenu(REMORA.sh.menu, 'Label', 'Interactive detector (LTSA)', ...
    'Enable','on','Callback', 'sh_pulldown(''interactive'')');
% Run ship detector
uimenu(REMORA.sh.menu, 'Label', 'Batch run detector', ...
    'Callback', 'sh_pulldown(''full_detector'')');
% Visualize labels
REMORA.sh.labelmenu = uimenu(REMORA.sh.menu, 'Label', 'Visualize detections');
uimenu(REMORA.sh.labelmenu, 'Label', 'Create labels from text file', ...
    'Enable','on','Callback', 'sh_pulldown(''create_labels'')');
uimenu(REMORA.sh.labelmenu, 'Label', 'Load labels (.tlab)', ...
    'Enable','on','Callback', 'sh_pulldown(''load_labels'')');
% Run evaluate interface
uimenu(REMORA.sh.menu, 'Label', 'Evaluate detections', ...
    'Enable','on','Callback', 'sh_pulldown(''evaluate_detections'')');


% --- Hardcoded Remora: SPICE Detector ---
% initialization script for spice detector remora
REMORA.spice_dt.menu = uimenu(HANDLES.remmenu,'Label','&SPICE-Detector',...
    'Enable','on','Visible','on');

% interactive xwav detector
uimenu(REMORA.spice_dt.menu, 'Label', 'Interactive detector', ...
    'Callback', 'sp_dt_pd(''xwav'')');
% Run both high and low res 
uimenu(REMORA.spice_dt.menu, 'Label', 'Batch run detector', ...
    'Callback', 'sp_dt_pd(''full_detector'')');
uimenu(REMORA.spice_dt.menu, 'Label', 'Convert detections to TPWS', ...
    'Callback', 'sp_dt_pd(''make_TPWS'')');

% --- Hardcoded Remora: Batch LTSA
REMORA.batchLTSA.menu = uimenu(HANDLES.remmenu,'Label','&Batch LTSA',...
    'Enable','on','Visible','on');
% Batch create LTSAs over multiple directories
uimenu(REMORA.batchLTSA.menu, 'Label', 'Batch create LTSAs', ...
    'Callback', 'batchLTSA_pulldown(''batch_ltsas'')');
                   




% % --- Hardcoded Remora: Logger ---
% REMORA.logmenu = uimenu(HANDLES.remmenu,'Label','&Log',...
%     'Enable','on','Visible','on');
% % select a logging GUI
% uimenu(REMORA.logmenu,'Label', 'New log', ...
%     'MenuSelectedFcn', {@initLogctrl, 'create'});
% uimenu(REMORA.logmenu, 'Label', 'Continue existing log', ...
%     'MenuSelectedFcn', {@initLogctrl, 'append'});
% uimenu(REMORA.logmenu, 'Label', 'Submit log', ...
%     'MenuSelectedFcn', @submit_to_tethys);
% uimenu(REMORA.logmenu, 'Label', 'Toggle workbook visibility', ...
%     'MenuSelectedFcn', {@control_log, 'workbook_visibility_toggle'});
% uimenu(REMORA.logmenu, 'Label', '&Add hotkey', 'Enable', 'on', ...
%     'Visible', 'on', 'MenuSelectedFcn', @addHotKey);
% 
% % allow Logger Remora to use the mouse click down button in the main
% % Plot Window 
% REMORA.pick.value = 1;
% % define what function to run after picking in the main Plot Window
% % put m-file name in REMORA.pick.fcn cell array in order of execution
% REMORA.pick.fcn{1} = {'logpickOn'};
% 
% % Function for adding hotkey commands to the plot figure
% xmlFile = which('keymapLogger.xml');
% PARAMS.keypress = xml_read(xmlFile);
% set(HANDLES.fig.main,'KeyPressFcn',@handleKeypress)


% === Help Menu ===
HANDLES.helpmenu = uimenu(HANDLES.fig.ctrl,'Label','&Help','Enable','on');
uimenu(HANDLES.helpmenu,'Label','&About Triton','Callback','miscpd(''dispAbout'')');
uimenu(HANDLES.helpmenu, 'Label','&Triton User Manual','Callback','open_TritonManual');

% === Message Window File Menu ===
HANDLES.msgmenu = uimenu(HANDLES.fig.msg,'Label','&File');
HANDLES.openpicks = uimenu(HANDLES.msgmenu,'Separator','off','Label','&Open Picks','Enable','on','Visible','on','Callback','filepd(''openpicks'')');
HANDLES.savepicks = uimenu(HANDLES.msgmenu,'Separator','off','Label','Save &Picks','Enable','off','Callback','filepd(''savepicks'')');
HANDLES.savemsgs  = uimenu(HANDLES.msgmenu,'Separator','on','Label','Save &Messages','Enable','on','Callback','filepd(''savemsgs'')');
HANDLES.clrmsgs   = uimenu(HANDLES.msgmenu,'Separator','off','Label','Clear Messages','Enable','on','Callback','filepd(''clrmsgs'')');

% Misc UI cleanup
set(gcf,'Units','pixels');
axis off
