function glo_blockfeedback(outwindow, strings, stats, textColor)
    
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    %
    % Program Written By: Alec Mather
    %
    % This function displays blockfeedback information.
    %
    % Inputs:
    %
    %   outwindow (int) == outwindow
    %
    %   strings (cell array) == 1xN cell array of strings that will be
    %   displayed next to each statistic.
    %       Example: strings = {'Mean RT: ', 'Percent Successful Stops: '};
    %
    %   stats (int vector) == 1xN vector with statistics that match element
    %       in cell array.
    %       Example: stats = [246, 37.5];
    %
    %   textColor (1x3 rbg matrix) == color of display text (if no input,
    %       default is white).
    %       Example: textColor = [255 0 255];
    %
    % Note:
    %
    %   Each string position in your cell array needs to match the
    %   corresponding statistic in your stats array.
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

    switch nargin
        
        case 3

        % Get Screen Dimensions
        owd = Screen('Rect',0);

        % Draw a statistic for each statistic
        for it = 1:size(stats,2)
            DrawFormattedText(outwindow, [strings{it} num2str(stats(it))], 'center', (owd(4)/((size(stats,2)+1))*it), [255 255 255]);
        end

        % Flip to outwindow
        Screen('Flip',outwindow);
        WaitSecs(1); KbWait(-1);
        
        case 4
            
        % Get Screen Dimensions
        owd = Screen('Rect',0);

        % Draw a statistic for each statistic
        for it = 1:size(stats,2)
            DrawFormattedText(outwindow, [strings{it} num2str(stats(it))], 'center', (owd(4)/((size(stats,2)+1))*it), textColor);
        end

        % Flip to outwindow
        Screen('Flip',outwindow);
        WaitSecs(1); KbWait(-1);
    end
end