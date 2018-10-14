function CGNG_outro(settings,trialseq,data)

% Draw to window
DrawFormattedText(settings.screen.outwindow, 'Thanks For Participating!', 'center', 'center', settings.layout.color.text);
Screen('Flip', settings.screen.outwindow);
WaitSecs(1); KbWait(-1);

% Clean up
save(fullfile(settings.files.outfolder,settings.files.outfile), 'trialseq', 'settings', 'data');
ShowCursor; Priority(0); ListenChar(0);

clear;clc

% All Done :)