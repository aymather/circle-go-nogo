function CGNG_intro(settings, trialseq, it)

% Block 1
if it == 1
    DrawFormattedText(settings.screen.outwindow, 'Press any key to begin task!', 'center', 'center', settings.layout.color.text);
    Screen('Flip', settings.screen.outwindow); %update screen
    WaitSecs(1); KbWait(-1);
end

% Everything else
if it < size(trialseq,1)
    DrawFormattedText(settings.screen.outwindow, 'Ready in 3...', 'center', 'center', settings.layout.color.text);
    Screen('Flip', settings.screen.outwindow);
    WaitSecs(1);
    DrawFormattedText(settings.screen.outwindow, 'Ready in 2...', 'center', 'center', settings.layout.color.text);
    Screen('Flip', settings.screen.outwindow);
    WaitSecs(1);
    DrawFormattedText(settings.screen.outwindow, 'Ready in 1...', 'center', 'center', settings.layout.color.text);
    Screen('Flip', settings.screen.outwindow);
    WaitSecs(1);
end