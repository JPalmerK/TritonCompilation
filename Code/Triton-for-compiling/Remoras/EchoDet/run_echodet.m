function run_echodet
% Wrapper for EchoDet menu call with REMORA setup
global REMORA

% Make sure REMORA has the expected field
if ~isfield(REMORA, 'fig')
    REMORA.fig = [];
end

% Call the EchoDet GUI
ec_pulldown('create_echoDet');
