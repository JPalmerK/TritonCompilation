projectRoot = "C:\Users\kaity\Documents\GitHub\TritonCompilation";
baseDir     = fullfile(projectRoot, "Code", "Triton-for-compiling");

% Gather every file under Triton-for-compiling
allEntries = dir(fullfile(baseDir,"**","*.*"));  
fileList   = allEntries(~[allEntries.isdir]);  

% Create build options for a standalone app
buildOpts = compiler.build.StandaloneApplicationOptions( ...
    fullfile(baseDir, "triton.m") ...
);
buildOpts.AdditionalFiles      = arrayfun( ...
    @(e) fullfile(e.folder,e.name), fileList, 'UniformOutput',false);
buildOpts.AutoDetectDataFiles  = true;
buildOpts.OutputDir            = fullfile(projectRoot, "StandAloneTests","build");
buildOpts.EmbedArchive         = false;    % keep the .ctf separate
buildOpts.ExecutableName       = "MyDesktopApplication";
buildOpts.ExecutableVersion    = "1.0.0";
buildOpts.Verbose              = true;

% Build — this creates StandAloneTests\build\MyDesktopApplication.exe
buildResult = compiler.build.standaloneApplication(buildOpts);
projectRoot = "C:\Users\kaity\Documents\GitHub\TritonCompilation";
baseDir     = fullfile(projectRoot, "Code", "Triton-for-compiling");

% Gather every file under Triton-for-compiling
allEntries = dir(fullfile(baseDir,"**","*.*"));  
fileList   = allEntries(~[allEntries.isdir]);  

% Create build options for a standalone app
buildOpts = compiler.build.StandaloneApplicationOptions( ...
    fullfile(baseDir, "triton.m") ...
);
buildOpts.AdditionalFiles      = arrayfun( ...
    @(e) fullfile(e.folder,e.name), fileList, 'UniformOutput',false);
buildOpts.AutoDetectDataFiles  = true;
buildOpts.OutputDir            = fullfile(projectRoot, "StandAloneTests","build");
buildOpts.EmbedArchive         = false;    % keep the .ctf separate
buildOpts.ExecutableName       = "MyDesktopApplication";
buildOpts.ExecutableVersion    = "1.0.0";
buildOpts.Verbose              = true;

% Build — this creates StandAloneTests\build\MyDesktopApplication.exe
buildResult = compiler.build.standaloneApplication(buildOpts);

buildDir = buildOpts.OutputDir;   % e.g. …\StandAloneTests\build
baseDir  = fullfile(projectRoot, "Code", "Triton-for-compiling");

% % Copy all files AND sub-folders (Remoras, Extras, sigproc, etc.) into the build
% copyfile( fullfile(baseDir, '*'), buildDir );