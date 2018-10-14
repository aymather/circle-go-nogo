function CGNG_blockfeedback(settings, trialseq, it, id, data)

    blocktrials = trialseq(trialseq(:,id.block) == trialseq(it,id.block),:);

    if data.baseline == 0
        % Collect stats
        gotrials = blocktrials(blocktrials(:,id.acc) == 1 | blocktrials(:,id.acc) == 2 | blocktrials(:,id.acc) == 99,:);
        nogotrials = blocktrials(blocktrials(:,id.acc) == 3 | blocktrials(:,id.acc) == 4,:);
        rt = mean(gotrials(gotrials(:,id.acc) == 1,id.rt));
        succstop = 100 * (nnz(nogotrials(:,id.acc) == 4) / size(nogotrials,1));
        memError = mean(abs(blocktrials(:,id.err)));
        missError = 100 * (((nnz(gotrials(:,id.acc) == 2)) + (nnz(gotrials(:,id.acc) == 99))) / (size(gotrials,1)));

        % Draw Stats to Screen
        DrawFormattedText(settings.screen.outwindow, ['Block #: ' num2str(blocktrials(1,id.block))], 'center', settings.blockdisp.blocknum, settings.layout.color.text);
        DrawFormattedText(settings.screen.outwindow, ['Mean RT: ' num2str(rt)], 'center', settings.blockdisp.rt, settings.layout.color.text);
        DrawFormattedText(settings.screen.outwindow, ['Percentage of Misses/Errors: ' num2str(missError)], 'center', settings.blockdisp.missError, settings.layout.color.text);
        DrawFormattedText(settings.screen.outwindow, ['Average Memory Error: ' num2str(memError) char(176)], 'center', settings.blockdisp.failstop, settings.layout.color.text);
        DrawFormattedText(settings.screen.outwindow, ['Percentage of Successful Stops: ' num2str(succstop)], 'center', settings.blockdisp.succstop, settings.layout.color.text);
        Screen('Flip', settings.screen.outwindow);
        WaitSecs(2); KbWait(-1);

        % Play countdown after ever block except last
        if it < size(trialseq,1)
            CGNG_intro(settings, trialseq, it);
        end
    else
        % Collect stats
        memError = mean(abs(blocktrials(:,id.err)));
        % Draw/print to screen
        DrawFormattedText(settings.screen.outwindow, ['Block #: ' num2str(blocktrials(end,id.block))], 'center', settings.blockdisp.blocknum, settings.layout.color.text);
        DrawFormattedText(settings.screen.outwindow, ['Average Memory Error: ' num2str(memError) char(176)], 'center', 'center', settings.layout.color.text);
        Screen('Flip',settings.screen.outwindow);
        WaitSecs(2); KbWait(-1);
        
        % Play countdown after ever block except last
        if it < size(trialseq,1)
            CGNG_intro(settings, trialseq, it);
        end
        
    end
        
end
































