function [height, width] = glo_drawArrow(outwindow, direction, cords, size_arrow, color_it)
    
    % Program Written by: Alec Mather
    %
    % This program draws an arrow on the screen at a specified location.
    %
    % Inputs:
    %
    %   outwindow(int) == outwindow
    %   direction(string) == which direction should the arrow face...
    %                                               'left' || 'right'
    %   cords(1x2 matrix) == x,y coordinates of the center location of the arrow
    %   size_arrow(int) == arbitrary unit that describes it's size
    %   color(1x3 rbg matrix) == color of the object (default is black)
    %
    % Outputs:
    %   
    %   height(int) == height of the object
    %   width(int) == width of the object
    
    if nargin < 5
        color = [0 0 0];
    else
        color = color_it;
    end
    height = (10*size_arrow)*2;
    width = (8*size_arrow) + (10*size_arrow);
    xmid = cords(1,1);
    ymid = cords(1,2);
    if strcmpi(direction, 'right')
        points = [xmid+(10*size_arrow),ymid;xmid+(2*size_arrow),ymid+(10*size_arrow);xmid+(2*size_arrow),ymid+(3*size_arrow);xmid-(8*size_arrow),ymid+(3*size_arrow);xmid-(8*size_arrow),ymid-(3*size_arrow);xmid+(2*size_arrow),ymid-(3*size_arrow);xmid+(2*size_arrow),ymid-(10*size_arrow)];
        Screen('FillPoly', outwindow, color, points);
    elseif strcmpi(direction, 'left')
        points = [xmid-(10*size_arrow),ymid;xmid-(2*size_arrow),ymid+(10*size_arrow);xmid-(2*size_arrow),ymid+(3*size_arrow);xmid+(8*size_arrow),ymid+(3*size_arrow);xmid+(8*size_arrow),ymid-(3*size_arrow);xmid-(2*size_arrow),ymid-(3*size_arrow);xmid-(2*size_arrow),ymid-(10*size_arrow)];
        Screen('FillPoly', outwindow, color, points);
    end

end