function glo_welcome(outwindow, string, textColor)

    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % Program Written By: Alec Mather
    %
    % This program will give you a welcome screen at the beginning of your
    % experiment.
    %
    % Inputs:
    %
    %   outwindow (int) == outwindow
    %   string (str) (optional) == replacement text for default welcome
    %   textColor (1x3 rbg vector) == custom color
    %
    %   Note:
    %       If you want to put in a custom color, you also have to put in a
    %       custom string.
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

    switch nargin
        
        case 1
            
            DrawFormattedText(outwindow, 'Press any key to begin task!', 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow); %update screen
            KbWait(-1);
        
        case 2
            
            DrawFormattedText(outwindow, string, 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow); %update screen
            KbWait(-1);
            
        case 3
            
            DrawFormattedText(outwindow, string, 'center', 'center', textColor);
            Screen('Flip', outwindow); %update screen
            KbWait(-1);
    end
end