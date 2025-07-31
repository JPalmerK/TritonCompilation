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