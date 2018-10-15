function trialseq = shuffle_me(trialseq,trialcol)
    
    % Very simple shuffle technique
    % Just feed in the trialsequence block you want to shuffle
    % trialcol = the column that contains your trial numbers (this must be the first column)
    
	random = randperm(size(trialseq,1))';
	trialseq(:,trialcol) = random;
	trialseq = sortrows(trialseq);
    
end