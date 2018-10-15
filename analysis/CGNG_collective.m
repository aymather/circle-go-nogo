% CGNG Full Analysis Script

id = CGNG_full_columns;

% FOLDERS
infolder = '/Users/alecmather/Desktop/Wessellab/MATLAB/CGNG/analysis/full_out/';
outfolder = '/Users/alecmather/Desktop/Wessellab/MATLAB/CGNG/analysis/full_analysis/';
clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
outfile = ['Analysis_' date '_' hrs '_' mins '_' '.mat'];

% FILES
files = dir(fullfile(infolder,'*.mat'));
filenames = {files.name};

% Data table Overall
DATA.overall = zeros(length(filenames),7);

for is = 1:length(filenames)
   
    load(fullfile(infolder,filenames{is}));
    behav = CGNG_full_breakup(trialseq,id);
    
    DATA.overall(is,1) = behav.overall.gotrials;
    DATA.overall(is,2) = behav.overall.nogotrials;
    DATA.overall(is,3) = behav.overall.correct;
    DATA.overall(is,4) = behav.overall.error;
    DATA.overall(is,5) = behav.overall.miss;
    DATA.overall(is,6) = behav.overall.failstop;
    DATA.overall(is,7) = behav.overall.succstop;
    
    blocks = trialseq(end,id.block);
    for ib = 1:blocks
        eval(['DATA.blockwise.gotrials(is,ib) = behav.blockwise.block' num2str(ib) '.gotrials']);
        eval(['DATA.blockwise.nogotrials(is,ib) = behav.blockwise.block' num2str(ib) '.nogotrials']);
        eval(['DATA.blockwise.correct(is,ib) = behav.blockwise.block' num2str(ib) '.correct']);
        eval(['DATA.blockwise.error(is,ib) = behav.blockwise.block' num2str(ib) '.error']);
        eval(['DATA.blockwise.miss(is,ib) = behav.blockwise.block' num2str(ib) '.miss']);
        eval(['DATA.blockwise.failstop(is,ib) = behav.blockwise.block' num2str(ib) '.failstop']);
        eval(['DATA.blockwise.succstop(is,ib) = behav.blockwise.block' num2str(ib) '.succstop']);
    end
    
end

% Put in Mean/Standard Error
DATA.overall = meanSE(DATA.overall,1);
DATA.blockwise.gotrials = meanSE(DATA.blockwise.gotrials,1);
DATA.blockwise.nogotrials = meanSE(DATA.blockwise.nogotrials,1);
DATA.blockwise.correct = meanSE(DATA.blockwise.correct,1);
DATA.blockwise.error = meanSE(DATA.blockwise.error,1);
DATA.blockwise.miss = meanSE(DATA.blockwise.miss,1);
DATA.blockwise.failstop = meanSE(DATA.blockwise.failstop,1);
DATA.blockwise.succstop = meanSE(DATA.blockwise.succstop,1);

