function glo_countdown(outwindow, textColor, string, count)

    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    %
    % Program Written By: Alec Mather
    %
    % This will count your participants in.
    % 
    % Arguments:
    %
    % outwindow (int) == outwindow
    % textColor (1x3 rgb matrix) (optional) == color of your text (default is white)
    % string (str) (optional) == Words used to count participants in (default is:
    %                                                      'Ready in...3'
    %                                                      'Ready in...2'
    %                                                      'Ready in...1')
    % count (int) (optional) == number to start your countdown from (default is 3)
    %
    % NOTE: 
    %       If you give this function a new string to work with, you must
    %       also provide it with a count.
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
    
    switch nargin
        case 1
            DrawFormattedText(outwindow, 'Ready in 3...', 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow);
            WaitSecs(1);
            DrawFormattedText(outwindow, 'Ready in 2...', 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow);
            WaitSecs(1);
            DrawFormattedText(outwindow, 'Ready in 1...', 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow);
            WaitSecs(1);
        case 2
            DrawFormattedText(outwindow, 'Ready in 3...', 'center', 'center', textColor);
            Screen('Flip', outwindow);
            WaitSecs(1);
            DrawFormattedText(outwindow, 'Ready in 2...', 'center', 'center', textColor);
            Screen('Flip', outwindow);
            WaitSecs(1);
            DrawFormattedText(outwindow, 'Ready in 1...', 'center', 'center', textColor);
            Screen('Flip', outwindow);
            WaitSecs(1);
        case 3
            for it = count:-1:1
            DrawFormattedText(outwindow, [string num2str(it)], 'center', 'center', [255 255 255]);
            Screen('Flip', outwindow);
            WaitSecs(1);
            end
        case 4
            for it = count:-1:1
            DrawFormattedText(outwindow, [string num2str(it)], 'center', 'center', textColor);
            Screen('Flip', outwindow);
            WaitSecs(1);
            end
    end
end