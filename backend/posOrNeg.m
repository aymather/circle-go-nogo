function sign = posOrNeg(settings,err_x,err_y,xcord,ycord)


    % Circle = an Nx2 matrix
    % column 1 = x coordinates
    % column 2 = y coordinates
    
    
    for i = 1:size(settings.points,1)
       
        if settings.points(i,1) == err_x && settings.points(i,2) == err_y
            err_idx = i;
        end
        
    end
    
    b = -1;
    for ii = err_idx:size(settings.points,1)
        b = b+1;
        if settings.points(ii, 1) == xcord && settings.points(ii,2) == ycord
            click_idx = b;
        end
    end
    
    for iii = 1:err_idx
        if settings.points(iii,1) == xcord && settings.points(iii,2) == ycord
            click_idx = b;
        end
        b = b+1;
    end
    
    if click_idx >= 180
        sign = 0; % negative
    else
        sign = 1; % positive
    end
    
end