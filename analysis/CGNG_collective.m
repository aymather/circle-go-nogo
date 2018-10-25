% CGNG Full Analysis Script

response_1 = input('Would you like to print a data summary?: ');

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
    FULL.overall(is,1) = behav.overall.thetas.gotrials;
    FULL.overall(is,2) = behav.overall.thetas.nogotrials;
    FULL.overall(is,3) = behav.overall.thetas.correct;
    FULL.overall(is,4) = behav.overall.thetas.error;
    FULL.overall(is,5) = behav.overall.thetas.miss;
    FULL.overall(is,6) = behav.overall.thetas.failstop;
    FULL.overall(is,7) = behav.overall.thetas.succstop;
    FULL.overall(is,8) = behav.overall.rt;
    FULL.overall(is,9) = behav.overall.rate.error;
    FULL.overall(is,10) = behav.overall.rate.miss;
    FULL.overall(is,11) = behav.overall.rate.failstop;
    FULL.overall(is,12) = behav.overall.rate.succstop;
    
    % place into blockwise data table
    blocks = trialseq(end,id.block);
    for ib = 1:blocks
        
        % Blockwise thetas
        eval(['FULL.blockwise.thetas.gotrials(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.gotrials']);
        eval(['FULL.blockwise.thetas.nogotrials(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.nogotrials']);
        eval(['FULL.blockwise.thetas.correct(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.correct']);
        eval(['FULL.blockwise.thetas.error(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.error']);
        eval(['FULL.blockwise.thetas.miss(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.miss']);
        eval(['FULL.blockwise.thetas.failstop(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.failstop']);
        eval(['FULL.blockwise.thetas.succstop(is,ib) = behav.blockwise.thetas.block' num2str(ib) '.succstop']);
        
        % Blockwise RT/rates
        eval(['FULL.blockwise.rt(is,ib) = behav.blockwise.rt.block' num2str(ib)]);
        eval(['FULL.blockwise.rate.error(is,ib) = behav.blockwise.rate.block' num2str(ib) '.error']);
        eval(['FULL.blockwise.rate.miss(is,ib) = behav.blockwise.rate.block' num2str(ib) '.miss']);
        eval(['FULL.blockwise.rate.failstop(is,ib) = behav.blockwise.rate.block' num2str(ib) '.failstop']);
        eval(['FULL.blockwise.rate.succstop(is,ib) = behav.blockwise.rate.block' num2str(ib) '.succstop']);
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
FULL.blockwise.thetas.gotrials = meanSE(FULL.blockwise.thetas.gotrials,1);
FULL.blockwise.thetas.nogotrials = meanSE(FULL.blockwise.thetas.nogotrials,1);
FULL.blockwise.thetas.correct = meanSE(FULL.blockwise.thetas.correct,1);
FULL.blockwise.thetas.error = meanSE(FULL.blockwise.thetas.error,1);
FULL.blockwise.thetas.miss = meanSE(FULL.blockwise.thetas.miss,1);
FULL.blockwise.thetas.failstop = meanSE(FULL.blockwise.thetas.failstop,1);
FULL.blockwise.thetas.succstop = meanSE(FULL.blockwise.thetas.succstop,1);
FULL.blockwise.rt = meanSE(FULL.blockwise.rt,1);
FULL.blockwise.rate.error = meanSE(FULL.blockwise.rate.error,1);
FULL.blockwise.rate.miss = meanSE(FULL.blockwise.rate.miss,1);
FULL.blockwise.rate.failstop = meanSE(FULL.blockwise.rate.failstop,1);
FULL.blockwise.rate.succstop = meanSE(FULL.blockwise.rate.succstop,1);
BASELINE.overall = meanSE(BASELINE.overall,1);
BASELINE.blockwise = meanSE(BASELINE.blockwise,1);

save(fullfile(outfolder,outfile),'FULL', 'BASELINE');

if response_1 == 1

    filename = 'overall_fullexp.xls';
    f = table(FULL.overall);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_gotrials.xls';
    f = table(FULL.blockwise.thetas.gotrials);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_nogotrials.xls';
    f = table(FULL.blockwise.thetas.nogotrials);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_correct.xls';
    f = table(FULL.blockwise.thetas.correct);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_error.xls';
    f = table(FULL.blockwise.thetas.error);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_miss.xls';
    f = table(FULL.blockwise.thetas.miss);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_failstop.xls';
    f = table(FULL.blockwise.thetas.failstop);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_succstop.xls';
    f = table(FULL.blockwise.thetas.succstop);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_rt.xls';
    f = table(FULL.blockwise.rt);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_error_rates.xls';
    f = table(FULL.blockwise.rate.error);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_miss_rates.xls';
    f = table(FULL.blockwise.rate.miss);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_failstop_rates.xls';
    f = table(FULL.blockwise.rate.failstop);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'blockwise_succstop_rates.xls';
    f = table(FULL.blockwise.rate.succstop);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'baseline_overall.xls';
    f = table(BASELINE.overall);
    writetable(f,filename);
    system(['open ' num2str(filename)]);

    filename = 'baseline_blockwise.xls';
    f = table(BASELINE.blockwise);
    writetable(f,filename);
    system(['open ' num2str(filename)]);
    
end