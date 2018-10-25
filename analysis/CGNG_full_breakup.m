function behav = CGNG_full_breakup(trialseq,id)

    % blockwise data
    blocks = trialseq(end,id.block);
    for ib = 1:blocks
        blocktrials = trialseq(trialseq(:,id.block) == ib,:);
        [thetas, rt, rate] = CGNG_full_breakdown(blocktrials,id);
        eval(['behav.blockwise.thetas.block' num2str(ib) '= thetas']);
        eval(['behav.blockwise.rt.block' num2str(ib) '= rt']);
        eval(['behav.blockwise.rate.block' num2str(ib) '= rate']);
    end

    % overall data
    [thetas, rt, rate] = CGNG_full_breakdown(trialseq,id);
    behav.overall.thetas = thetas;
    behav.overall.rt = rt;
    behav.overall.rate = rate;
    
end

function [thetas, rt, rate] = CGNG_full_breakdown(trialseq,id)

    gotrials = trialseq(trialseq(:,id.stan) == 0,:);
    nogotrials = trialseq(trialseq(:,id.stan) == 1,:);
    
    go_theta = mean(abs(gotrials(:,id.err)));
    nogo_theta = mean(abs(nogotrials(:,id.err)));
    
    correct = gotrials(gotrials(:,id.acc) == 1,:);
    succstop = nogotrials(nogotrials(:,id.acc) == 4,:);
    failstop = nogotrials(nogotrials(:,id.acc) == 3,:);
    miss = gotrials(gotrials(:,id.acc) == 99,:);
    error = gotrials(gotrials(:,id.acc) == 2,:);
    
    % RT
    rt = 1000 * (mean(correct(:,id.rt)));
    
    % Rates
    rate.error = 100 * (size(error,1) / size(gotrials,1));
    rate.miss = 100 * (size(miss,1) / size(gotrials,1));
    rate.failstop = 100 * (size(failstop,1) / size(nogotrials,1));
    rate.succstop = 100 * (size(succstop,1) / size(nogotrials,1));
    
    ct_theta = mean(abs(correct(:,id.err)));
    ss_theta = mean(abs(succstop(:,id.err)));
    fs_theta = mean(abs(failstop(:,id.err)));
    miss_theta = mean(abs(miss(:,id.err)));
    error_theta = mean(abs(error(:,id.err)));
    
    thetas.gotrials = go_theta;
    thetas.nogotrials = nogo_theta;
    thetas.correct = ct_theta;
    thetas.succstop = ss_theta;
    thetas.failstop = fs_theta;
    thetas.miss = miss_theta;
    thetas.error = error_theta;
    
    %     disp(['go trial theta: ' num2str(go_theta)]);
    %     disp(['nogo trial theta: ' num2str(nogo_theta)]);
    %     disp(['correct trial theta: ' num2str(ct_theta)]);
    %     disp(['successful stop theta: ' num2str(ss_theta)]);
    %     disp(['failed stop theta: ' num2str(fs_theta)]);
    %     disp(['miss theta: ' num2str(miss_theta)]);
    %     disp(['error theta: ' num2str(error_theta)]);
    
end