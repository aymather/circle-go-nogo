function [rt,resp,x,y] = glo_getmouse(duration, fh, fhoffset, fh1, fh1offset, functioninputs)

    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    %
    % Program Written By: Alec Mather
    %
    % This program is a shortened version of a GetMouse code series
    % frequently used in our lab where we check for a certain amount of
    % time, and if we get a response within that time, we want the RT and
    % response value (1 | 2)
    %
    % Input arguments:
    %
    % duration (int) == how long should the program check for?
    % fh (function) (optional) == after a certain delay, perform this
    %   function.
    % delay (int) (must be given if fh is given) == how long after start
    %   checking should the function be executed?
    % fh2 & fh2offset inputs are the same as fh & fhoffset
    % functioninputs (any) == any input that you need to pass into your
    %       function. If you're executing two functions, 'functioninputs'
    %       will be passed into both.
    %
    % Outputs:
    %
    % rt == reaction time
    % resp == 1 | 2, left or right mouse click (if you're expecting a 3 for
    %       a right mouse click, this function corrects for that and sets
    %       that to a 2.
    % x == x coordinate (where the mouse is when response is made)
    % y == y coordinate
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

    flag = true;
    flag1 = true;
    rt = 0;
    resp = 0;
    x = []; y = [];
    starttime = GetSecs;

    switch nargin
        case 1

            while GetSecs - starttime <= duration
                [x,y,buttons] = GetMouse;
                if any(buttons)
                    rt = GetSecs - starttime;
                    resp = find(buttons);
                    if resp == 3
                        resp = 2;
                    end
                    break
                end
            end

        case 3

            while GetSecs - starttime <= duration
                if flag == true && GetSecs - starttime >= fhoffset
                    fh();
                    flag = false;
                end
                [x,y,buttons] = GetMouse;
                if any(buttons)
                    rt = GetSecs - starttime;
                    resp = find(buttons);
                    if resp == 3
                        resp = 2;
                    end
                    break
                end
            end
            
        case 4

            while GetSecs - starttime <= duration
                if flag == true && GetSecs - starttime >= fhoffset
                    fh(functioninputs);
                    flag = false;
                end
                [x,y,buttons] = GetMouse;
                if any(buttons)
                    rt = GetSecs - starttime;
                    resp = find(buttons);
                    if resp == 3
                        resp = 2;
                    end
                    break
                end
            end
            
        case 5

            while GetSecs - starttime <= duration
                if flag == true && GetSecs - starttime >= fhoffset
                    fh();
                    flag = false;
                end
                [x,y,buttons] = GetMouse;
                if any(buttons)
                    rt = GetSecs - starttime;
                    resp = find(buttons);
                    if resp == 3
                        resp = 2;
                    end
                    break
                end
            end

        case 6

            while GetSecs - starttime <= duration
                if flag == true && GetSecs - starttime >= fhoffset
                    fh(functioninputs);
                    flag = false;
                end
                if flag1 == true && GetSecs - starttime >= fh1offset
                    fh1(functioninputs);
                    flag1 = false;
                end
                [x,y,buttons] = GetMouse;
                if any(buttons)
                    rt = GetSecs - starttime;
                    resp = find(buttons);
                    if resp == 3
                        resp = 2;
                    end
                    break
                end
            end
    end
end