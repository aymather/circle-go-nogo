function behav = CGNG_baseline_breakup(trialseq,id)

    blocks = trialseq(end,id.block);
    for ib = 1:blocks
        
        blocktrials = trialseq(trialseq(:,id.block) == ib,:);
        baseline_theta = CGNG_baseline_breakdown(blocktrials,id);
        eval(['behav.block' num2str(ib) '= baseline_theta']);
        
    end
    
    baseline_theta = CGNG_baseline_breakdown(trialseq,id);
    behav.overall = baseline_theta;

end

function theta = CGNG_baseline_breakdown(trialseq,id)

    theta = mean(abs(trialseq(:,id.err)));
    
    %   disp(['Theta: ' num2str(theta)]);
    
end