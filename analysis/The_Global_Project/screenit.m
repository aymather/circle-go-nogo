function [outwindow, outwindowdims, screenNumber] = screenit(bg_color)
    
    %
    % Program written by: Alec Mather
    %
    % This function opens your on screen window. This function defaults to
    % the 'max' screen which is the one that you are on. If you want to
    % point to a different screen just change the function by calling a
    % different screen number.
    %
    % Inputs:
    %   
    %   bg_color(1x3 rbg matrix)(optional) == custom background color
    %

    if nargin < 1
        screens = Screen('Screens');
        screenNumber = max(screens);
        [outwindow, outwindowdims] = Screen('OpenWindow', screenNumber, [0 0 0]);% default bg (black)
        Priority(MaxPriority(outwindow)); % prioritize
    else
        screens = Screen('Screens');
        screenNumber = max(screens);
        [outwindow, outwindowdims] = Screen('OpenWindow', screenNumber, bg_color);% custom screen color
        Priority(MaxPriority(outwindow)); % prioritize
    end
    
end