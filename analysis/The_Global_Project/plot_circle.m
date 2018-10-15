function [xunit, yunit] = plot_circle(r,points,x,y)

    % This functin plots an imaginary circle on your screen
    %
    % Usage:
    %
    % r = radius of your circle
    % points = number of points on your circle (180+ recommended)
    % 
    % Defaulted position of the circle is on the middle of the screen.
    % Change position by adding the (x,y) coordinates of the circle 
    % you want to plot. (Arguments 3 & 4)
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

    if nargin == 2

        rect = Screen('Rect',0);
        
        th = 0:pi/points:2*pi;
        xunit = r * cos(th) + rect(3);
        yunit = r * sin(th) + rect(4);
        
    else
        
        th = 0:pi/points:2*pi;
        xunit = r * cos(th) + x;
        yunit = r * sin(th) + y;
        
    end
    
end
