function remoras = get_installed_remoras()
%GET_INSTALLED_REMORAS  Return a hard-coded list of all Remoras for standalone builds.
%   This bypasses dynamic directory scanning to ensure compatibility in a compiled app.

    remoras = {
        'Airgun-Detector',
        'BatchLTSA',
        'BlueWhaleBcall-Detector',
        'ClusterTool',
        'EchoDet',
        'Explosion-Detector',
        'FinWhaleIndex',
        'Fish detector',
        'ImageSet',
        'LabelVis',
        'Logger',
        'NNet',
        'SPICE-Detector',
        'Ship-Detector'
    };
end
