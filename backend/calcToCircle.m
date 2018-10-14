function [xcord, ycord] = calcToCircle(settings,x,y)

    % settings.points is an nx2 matrix containing all the x and y coordinates
    % plotted on a circle.
    % x & y are the coordinates of the point that you're calculating to the
    % circle.

    % preassign
    distance = [];

    for i = 1:(size(settings.points,1))

        distance = [distance,sqrt(((settings.points(i,1) - x) ^2) + ((settings.points(i,2) - y)^2))];

    end

    [~,idx] = min(distance);
    xcord = settings.points(idx,1);
    ycord = settings.points(idx,2);

end