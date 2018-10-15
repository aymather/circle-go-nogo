function [height, width] = glo_drawCross(outwindow, cords, size_it, color_it)

    % Program Written by: Alec Mather
    %
    % This function draws a cross at a specific location on your screen
    %
    % Inputs:
    %   
    %   outwindow(int) == outwindow
    %   cords(1x2 matrix) == x,y coordinates of the center of object
    %   size_it(int) == arbitrary multiplier that defines the size of the
    %       object (basic size is ~5)
    %   color_it(1x3 rbg matrix)(optional) == color of object
    %
    % Outputs:
    %   
    %   height(int) == height of object
    %   width(int) == width of object
    
    if nargin < 4
        color = [0 0 0];
    else
        color = color_it;
    end
    tree = 8;
    branch = 2;
    height = tree*size_it;
    width = tree*size_it;
    xmid = cords(1);
    ymid = cords(2);
    points = [xmid+(tree*size_it),ymid+(branch*size_it);xmid+(branch*size_it),ymid+(branch*size_it);xmid+(branch*size_it),ymid+(tree*size_it);xmid-(branch*size_it),ymid+(tree*size_it);xmid-(branch*size_it),ymid+(branch*size_it);xmid-(tree*size_it),ymid+(branch*size_it);xmid-(tree*size_it),ymid-(branch*size_it);xmid-(branch*size_it),ymid-(branch*size_it);xmid-(branch*size_it),ymid-(tree*size_it);xmid+(branch*size_it),ymid-(tree*size_it);xmid+(branch*size_it),ymid-(branch*size_it);xmid+(tree*size_it),ymid-(branch*size_it)];
    Screen('FillPoly', outwindow, color, points);

end