% CGNG Full Analysis Script

% get data columns for full exp and baseline exp
id = CGNG_full_columns;
id_baseline = CGNG_baseline_columns;

% FOLDERS
infolder = fullfile(fileparts(which('CGNG_collective')), 'full_out');
outfolder = fullfile(fileparts(which('CGNG_collective.m')),'finished_analysis');
clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
outfile = ['Analysis_' date '_' hrs '_' mins '_' '.mat'];

% FILES
files = dir(fullfile(infolder,'*.mat'));
filenames = {files.name};

% FOLDERS_baseline
infolder_baseline = fullfile(fileparts(which('CGNG_collective.m')),'baseline_out');
clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));

% FILES
files_baseline = dir(fullfile(infolder_baseline,'*.mat'));
filenames_baseline = {files_baseline.name};

% Data table Overall
FULL.overall = zeros(length(filenames),7);
BASELINE.overall = zeros(length(filenames),1);

for is = 1:length(filenames)
   
    % load in full experiment files
    load(fullfile(infolder,filenames{is}));
    
    % run analysis
    behav = CGNG_full_breakup(trialseq,id);
    
    % place into data table
    FULL.overall(is,1) = behav.overall.gotrials;
    FULL.overall(is,2) = behav.overall.nogotrials;
    FULL.overall(is,3) = behav.overall.correct;
    FULL.overall(is,4) = behav.overall.error;
    FULL.overall(is,5) = behav.overall.miss;
    FULL.overall(is,6) = behav.overall.failstop;
    FULL.overall(is,7) = behav.overall.succstop;
    
    % place into blockwise data table
    blocks = trialseq(end,id.block);
    for ib = 1:blocks
        eval(['FULL.blockwise.gotrials(is,ib) = behav.blockwise.block' num2str(ib) '.gotrials']);
        eval(['FULL.blockwise.nogotrials(is,ib) = behav.blockwise.block' num2str(ib) '.nogotrials']);
        eval(['FULL.blockwise.correct(is,ib) = behav.blockwise.block' num2str(ib) '.correct']);
        eval(['FULL.blockwise.error(is,ib) = behav.blockwise.block' num2str(ib) '.error']);
        eval(['FULL.blockwise.miss(is,ib) = behav.blockwise.block' num2str(ib) '.miss']);
        eval(['FULL.blockwise.failstop(is,ib) = behav.blockwise.block' num2str(ib) '.failstop']);
        eval(['FULL.blockwise.succstop(is,ib) = behav.blockwise.block' num2str(ib) '.succstop']);
    end
    
    % load in baseline files
    load(fullfile(infolder_baseline,filenames_baseline{is}));
    
    % run analysis on baseline files
    behav = CGNG_baseline_breakup(trialseq,id_baseline);
    
    % get number of blocks
    blocks = trialseq(end,id_baseline.block);
    
    % preset data table
    BASELINE.overall(is,1) = behav.overall;
    
    % write blockwise data into final data table
    for ib = 1:blocks
        eval(['BASELINE.blockwise(is,ib) = behav.block' num2str(ib)]);
    end

end

% Put in Mean/Standard Error
FULL.overall = meanSE(FULL.overall,1);
FULL.blockwise.gotrials = meanSE(FULL.blockwise.gotrials,1);
FULL.blockwise.nogotrials = meanSE(FULL.blockwise.nogotrials,1);
FULL.blockwise.correct = meanSE(FULL.blockwise.correct,1);
FULL.blockwise.error = meanSE(FULL.blockwise.error,1);
FULL.blockwise.miss = meanSE(FULL.blockwise.miss,1);
FULL.blockwise.failstop = meanSE(FULL.blockwise.failstop,1);
FULL.blockwise.succstop = meanSE(FULL.blockwise.succstop,1);
BASELINE.overall = meanSE(BASELINE.overall,1);
BASELINE.blockwise = meanSE(BASELINE.blockwise,1);

save(fullfile(outfolder,outfile),'FULL', 'BASELINE');
