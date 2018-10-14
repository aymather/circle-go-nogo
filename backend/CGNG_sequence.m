function trialseq = CGNG_sequence(settings,data,id)

trialseq = [];
col = length(fieldnames(id));

if data.baseline == 0 
    
    for it = 1:settings.general.blocks

        % Get trial types
        go_left = int64((settings.general.trials * settings.general.go) * settings.general.side);
        go_right = int64((settings.general.trials * settings.general.go) * settings.general.side);
        nogo_left = int64((settings.general.trials * settings.general.nogo) * settings.general.side);
        nogo_right = int64((settings.general.trials * settings.general.nogo) * settings.general.side);

        % Create sub tables
        go_left = zeros(go_left, col);
        go_left(1:size(go_left,1)/2, id.side) = 1;
        go_left(size(go_left,1)/2+1:end,id.side) = 2;

        go_right = zeros(go_right, col);
        go_right(1:size(go_right,1)/2, id.side) = 1;
        go_right(size(go_right,1)/2+1:end,id.side) = 2;

        nogo_left = zeros(nogo_left, col);
        nogo_left(1:size(nogo_left,1)/2, id.side) = 1;
        nogo_left(size(nogo_left,1)/2+1:end,id.side) = 2;
        nogo_left(:, id.stan) = 1;

        nogo_right = zeros(nogo_right, col);
        nogo_right(1:size(nogo_right,1)/2, id.side) = 1;
        nogo_right(size(nogo_right,1)/2+1:end,id.side) = 2;
        nogo_right(:, id.stan) = 1;

        % Merge
        block = [go_left; go_right; nogo_left; nogo_right];

        % Shuffle
        random = randperm(size(block,1))';
        block(:,id.trialNum) = random;
        block = sortrows(block);

        % Block num
        block(:,id.block) = it;

        % Merge into trialseq
        trialseq = [trialseq; block];

    end

    % Give trial numbers
    for it = 1:size(trialseq,1)
        trialseq(it,id.trialNum) = it;
    end

else
    
    for ib = 1:settings.general.blocks
        
        % Get trial numbers
        left = int64(settings.general.trials * settings.general.side);
        right = int64(settings.general.trials * settings.general.side);

        % Create chunks
        left = zeros(left, col);
        left(:,id.side) = 1;

        right = zeros(right,col);
        right(:,id.side) = 2;

        % Merge
        block = [left; right];

        % Shuffle
        random = randperm(size(block,1))';
        block(:,id.trialNum) = random;
        block = sortrows(block);

        % Block num
        block(:,id.block) = ib;

        % Merge into trialseq
        trialseq = [trialseq; block];
        
    end
    
    % Give trial numbers
    for ib = 1:size(trialseq,1)
        trialseq(ib,id.trialNum) = ib;
    end
    
end



















