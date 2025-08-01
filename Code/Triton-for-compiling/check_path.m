function check_path
% CHECK_PATH  Configure directory paths for slimmed-down Triton
global PARAMS

% Use current directory as Triton root (works in compiled and dev modes)
rootDir = pwd;

% Set core paths
PARAMS.path.Triton   = rootDir;
PARAMS.path.Settings = fullfile(rootDir, 'Settings');
PARAMS.path.Extras   = fullfile(rootDir, 'Extras');
PARAMS.path.Remoras  = fullfile(rootDir, 'Remoras');
PARAMS.path.tools    = fullfile(rootDir, 'Tools');

% Add the extras path for the logo
addpath(PARAMS.path.Extras);

% Add Explosion Detector Remora path directly (only one we're using)
addpath(fullfile(PARAMS.path.Remoras, 'Explosion-Detector'));
addpath(fullfile(PARAMS.path.Remoras, 'Fish detector'));
addpath(fullfile(PARAMS.path.Remoras, 'EchoDet'));
addpath(fullfile(PARAMS.path.Remoras, 'Airgun-Detector'));

addpath(fullfile(PARAMS.path.Remoras, 'LabelVis'));
addpath(fullfile(PARAMS.path.Remoras, 'LabelVis', 'make_tLabs'));
addpath(fullfile(PARAMS.path.Remoras, 'LabelVis', 'initWindows'));
addpath(fullfile(PARAMS.path.Remoras, 'LabelVis', 'vis_Labels'));

addpath(fullfile(PARAMS.path.Remoras, 'ClusterTool'));
addpath(fullfile(PARAMS.path.Remoras, 'ClusterTool', 'cluster'));
addpath(fullfile(PARAMS.path.Remoras, 'ClusterTool', 'extratools'));
addpath(fullfile(PARAMS.path.Remoras, 'ClusterTool', 'gui'));
addpath(fullfile(PARAMS.path.Remoras, 'ClusterTool', 'settings'));

addpath(fullfile(PARAMS.path.Remoras, 'Soundscape-Metrics'));
addpath(fullfile(PARAMS.path.Remoras, 'Soundscape-Metrics', 'cmpt'));
addpath(fullfile(PARAMS.path.Remoras, 'Soundscape-Metrics', 'gui'));
addpath(fullfile(PARAMS.path.Remoras, 'Soundscape-Metrics', 'ltsa'));
addpath(fullfile(PARAMS.path.Remoras, 'Soundscape-Metrics', 'settings'));

addpath(fullfile(PARAMS.path.Remoras, 'Ship-Detector'));
addpath(fullfile(PARAMS.path.Remoras, 'Ship-Detector', 'detection'));
addpath(fullfile(PARAMS.path.Remoras, 'Ship-Detector', 'gui'));
addpath(fullfile(PARAMS.path.Remoras, 'Ship-Detector', 'evaluation'));
addpath(fullfile(PARAMS.path.Remoras, 'Ship-Detector', 'settings'));

addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector'));
addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector', 'detection'));
addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector', 'gui'));
addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector', 'funs'));
addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector', 'settings'));
addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector', 'io'));
addpath(fullfile(PARAMS.path.Remoras, 'SPICE-Detector', 'ui'));


addpath(fullfile(PARAMS.path.Remoras, 'BatchLTSA'));
addpath(fullfile(PARAMS.path.Remoras, 'BatchLTSA', 'wiki'));


% addpath(fullfile(PARAMS.path.Remoras, 'Logger'));
% addpath(fullfile(PARAMS.path.Remoras, 'Logger', 'log_data'));
