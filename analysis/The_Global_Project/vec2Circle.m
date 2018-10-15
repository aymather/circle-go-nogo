function [x,y] = vec2Circle(r,m)

    x = r / (sqrt(1 + (m^2)));
    y = (m * r) / (sqrt(1 + (m^2)));

end