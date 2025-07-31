function run_echodet_idfiles
% Wrapper for EchoDet ID file creation
global REMORA

if ~isfield(REMORA, 'fig')
    REMORA.fig = [];
end

ec_pulldown('create_IDfiles');
