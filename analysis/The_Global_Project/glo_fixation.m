function time = glo_fixation(outwindow, duration, color)

    %
    % Program Written By: Alec Mather
    %
    % Draws a fixation cross at the center of the screen with a default
    % color of white.
    %
    % Inputs:
    %   
    %   outwindow (int) == outwindow
    %   duration (int) (optional) == wait for how long before exiting
    %       function
    %   color (1x3 rbg matrix) (optional arg) == fixation color
    %
    %
    
    switch nargin

        case 1

            DrawFormattedText(outwindow, '+', 'center', 'center', [255 255 255]);
            time = Screen('Flip',outwindow);
    
        case 2
            
            DrawFormattedText(outwindow, '+', 'center', 'center', [255 255 255]);
            time = Screen('Flip',outwindow);
            WaitSecs(duration);
            
        case 3
            
            DrawFormattedText(outwindow, '+', 'center', 'center', color);
            time = Screen('Flip',outwindow);
            WaitSecs(duration);
            
    end
end