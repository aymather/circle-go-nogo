function glo_outro(outwindow, string, textColor)

    %
    % Program Written By: Alec Mather
    %
    % This function provides an outro screen for your experiment.
    %
    % Inputs:
    %   
    %   outwindow(int) == outwindow
    %   string(str) (optional) == custom string to display on the screen
    %   textColor(1x3 rbg matrix)(optional) == custom text color
    %
    % Note:
    %   If you want to change the text color, you must also provide a 
    %   custom string.
    %

    switch nargin
        
        case 1

            DrawFormattedText(outwindow, 'Thank You Very Much For Your Participation!', 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow); %update screen
            WaitSecs(1); KbWait(-1);
        
        case 2
            
            DrawFormattedText(outwindow, string, 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow); %update screen
            WaitSecs(1); KbWait(-1);
            
        case 3
            
            DrawFormattedText(outwindow, string, 'center', 'center', textColor);
            Screen('Flip', outwindow); %update screen
            WaitSecs(1); KbWait(-1);
            
    end

end