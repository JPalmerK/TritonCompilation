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

% --- Hardcoded Remora: Explosion Detector ---
HANDLES.explosionMenu = uimenu(HANDLES.toolmenu, 'Label', 'Explosion Detector', 'Enable', 'on', 'Visible', 'on');
uimenu(HANDLES.explosionMenu, 'Label', 'Run Explosion Detector', 'Callback', 'ex_detect_pulldown');

% --- Hardcoded Remora: Fish Detector ---
HANDLES.fishMenu = uimenu(HANDLES.toolmenu, 'Label', 'Fish Detector', 'Enable', 'on', 'Visible', 'on');
uimenu(HANDLES.fishMenu, 'Label', 'Run Fish Detector', 'Callback', 'pi_pulldown(''full_detector'')');


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
