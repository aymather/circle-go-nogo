function [xunit, yunit] = plot_circle_for_rundots(x,y,r)

    th = 0:pi/75:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    
end
    
