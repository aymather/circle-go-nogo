function glo_drawFlankerTask(outwindow, local, glob, cords, size_it, color_it)

    % Program written by: Alec Mather
    %
    % This function draws the "Flanker Task" global variable as either a
    % left or right arrow or a neutral (+) stimulus, with 3 different local options(left, right, +)
    % at any location on your screen.
    %
    % Inputs:
    %   
    %   outwindow(int) == outwindow
    %   local(string) == what is the local variable? 
    %         options: 'left','right','+'
    %   glob(string) == what is the global variable?
    %         options: 'left','right', '+'
    %   cords(1x2 matrix) == x,y coordinates of the center of the object
    %   size_it(int) == arbitrary multiplier that defines objects size
    %         recommended: ~3.5
    %   color_it(1x3 rbg matrix)(optional) == color of object

    if nargin < 6
        color = [0 0 0];
    else
        color = color_it;
    end
    x = cords(1);
    y = cords(2);
    if strcmpi(local, '+')
        [height] = glo_drawCross(outwindow, cords, size_it, color);
        spacing = (height*2) + 10;
        cords_up_one_y = cords(1,2) - spacing;
        if strcmpi(glob,'left')
            cords_RL_one_x = cords(1,1) - spacing;
        elseif strcmpi(glob,'right')
            cords_RL_one_x = cords(1,1) + spacing;
        elseif strcmpi(glob,'+')
            cords_RL_one_x = cords(1,1);
        end
        glo_drawCross(outwindow, [cords_RL_one_x,cords_up_one_y], size_it, color);
        cords_up_two_y = cords(1,2) - (spacing*2);
        glo_drawCross(outwindow, [cords(1,1),cords_up_two_y], size_it, color);
        cords_down_one_y = cords(1,2) + spacing;
        if strcmpi(glob, 'left')
            cords_RL_one_x = cords(1,1) - spacing;
        elseif strcmpi(glob, 'right')
            cords_RL_one_x = cords(1,1) + spacing;
        elseif strcmpi(glob,'+')
            cords_RL_one_x = cords(1,1);
        end
        glo_drawCross(outwindow, [cords_RL_one_x,cords_down_one_y], size_it, color);
        cords_down_two_y = cords(1,2) + (spacing*2);
        glo_drawCross(outwindow, [cords(1,1),cords_down_two_y], size_it, color);
        cords_right_one_x = cords(1,1) + spacing;
        glo_drawCross(outwindow, [cords_right_one_x,cords(1,2)], size_it, color);
        cords_right_two_x = cords(1,1) + (spacing*2);
        glo_drawCross(outwindow, [cords_right_two_x,cords(1,2)], size_it, color);
        cords_left_one_x = cords(1,1) - spacing;
        glo_drawCross(outwindow, [cords_left_one_x,cords(1,2)], size_it, color);
        cords_left_two_x = cords(1,1) - (spacing*2);
        glo_drawCross(outwindow, [cords_left_two_x,cords(1,2)], size_it, color);
    else
        if strcmpi(local, 'left')
            arrow = 'left';
        else
            arrow = 'right';
        end
        [height, width] = glo_drawArrow(outwindow, arrow, cords, size_it, color);
        spacing_h = height + 10;
        spacing_w = width + 10;
        cords_up_one_y = cords(1,2) - spacing_h;
        if strcmpi(glob,'left')
            cords_RL_one_x = cords(1,1) - spacing_w;
        elseif strcmpi(glob,'right')
            cords_RL_one_x = cords(1,1) + spacing_w;
        elseif strcmpi(glob,'+')
            cords_RL_one_x = cords(1,1);
        end
        glo_drawArrow(outwindow, arrow, [cords_RL_one_x,cords_up_one_y], size_it, color);
        cords_up_two_y = cords(1,2) - (spacing_h*2);
        glo_drawArrow(outwindow, arrow, [cords(1,1),cords_up_two_y], size_it, color);
        cords_down_one_y = cords(1,2) + spacing_h;
        if strcmpi(glob,'left')
            cords_RL_one_x = cords(1,1) - spacing_w;
        elseif strcmpi(glob,'right')
            cords_RL_one_x = cords(1,1) + spacing_w;
        elseif strcmpi(glob,'+')
            cords_RL_one_x = cords(1,1);
        end
        glo_drawArrow(outwindow, arrow, [cords_RL_one_x,cords_down_one_y], size_it, color);
        cords_down_two_y = cords(1,2) + (spacing_h*2);
        glo_drawArrow(outwindow, arrow, [cords(1,1),cords_down_two_y], size_it, color);
        cords_right_one_x = cords(1,1) + spacing_w;
        glo_drawArrow(outwindow, arrow, [cords_right_one_x,cords(1,2)], size_it, color);
        cords_right_two_x = cords(1,1) + (spacing_w*2);
        glo_drawArrow(outwindow, arrow, [cords_right_two_x,cords(1,2)], size_it, color);
        cords_left_one_x = cords(1,1) - spacing_w;
        glo_drawArrow(outwindow, arrow, [cords_left_one_x,cords(1,2)], size_it, color);
        cords_left_two_x = cords(1,1) - (spacing_w*2);
        glo_drawArrow(outwindow, arrow, [cords_left_two_x,cords(1,2)], size_it, color);  
    end
    
end