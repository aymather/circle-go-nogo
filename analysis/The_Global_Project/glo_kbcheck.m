function [rt, resp] = glo_kbcheck(duration, respKeys, fh, fhoffset, fh2, fh2offset, functioninputs)

    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    %
    % Program Written By: Alec Mather
    %
    % This function checks for two keyboard responses and breaks
    % out of loop when a response is recorded. This function can
    % also accept up to 2 functions to execute during these checks.
    % Those function inputs MUST ALSO have an offset time which is
    % the time of execution after the check starts.
    %
    % Inputs:
    %   
    %   duration (int) = how long should the function check for?
    %       Example: duration = 1;
    %   respKeys (cell array) = which keys on keyboard should be checked?
    %       Example: respKeys = {'q','p'};
    %   fh (function handle) (optional) = first function to be executed
    %       Example: fh = @myFunction;
    %   fhoffset (int) (required if fh is present) = offset from start time
    %       Example: fhoffset = .05;
    %   fh2 & fh2offset have same parameters as fh & fhoffset
    %   functioninputs (any) == any input that you need to pass into your
    %       function. If you're executing two functions, 'functioninputs'
    %       will be passed into both.
    %
    % Outputs:
    %
    %   rt == Reaction time from beginning of check
    %   resp == 1 | 2, this will map onto your respKeys variable
    %           Example: respKeys = {'q','p'};
    %                    q == 1; p == 2;
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    
    rt = 0;
    resp = 0;
    flag = true;
    flag2 = true;
    starttime = GetSecs;
    
    switch nargin
        
        case 2

            while GetSecs - starttime <= duration
                [~,~,keycode] = KbCheck(-1);
                if KbName(keycode) == respKeys{1}
                    resp = 1;
                    rt = GetSecs - starttime;
                    break
                elseif KbName(keycode) == respKeys{2}
                    resp = 2;
                    rt = GetSecs - starttime;
                    break
                end
                WaitSecs(0.001); % prevent overload
            end
        
        case 4

            while GetSecs - starttime <= duration
                if GetSecs - starttime >= fhoffset && flag == true
                    fh();
                    flag = false;
                end
                [~,~,keycode] = KbCheck(-1);
                if KbName(keycode) == respKeys{1}
                    resp = 1;
                    rt = GetSecs - starttime;
                    break
                elseif KbName(keycode) == respKeys{2}
                    resp = 2;
                    rt = GetSecs - starttime;
                    break
                end
                WaitSecs(0.001); % prevent overload
            end
            
        case 5

            while GetSecs - starttime <= duration
                if GetSecs - starttime >= fhoffset && flag == true
                    fh(functioninputs);
                    flag = false;
                end
                [~,~,keycode] = KbCheck(-1);
                if KbName(keycode) == respKeys{1}
                    resp = 1;
                    rt = GetSecs - starttime;
                    break
                elseif KbName(keycode) == respKeys{2}
                    resp = 2;
                    rt = GetSecs - starttime;
                    break
                end
                WaitSecs(0.001); % prevent overload
            end
            
        case 6

            while GetSecs - starttime <= duration
                if GetSecs - starttime >= fhoffset && flag == true
                    fh();
                    flag = false;
                end
                if GetSecs - starttime >= fh2offset && flag2 == true
                    fh2();
                    flag2 = false;
                end
                [~,~,keycode] = KbCheck(-1);
                if KbName(keycode) == respKeys{1}
                    resp = 1;
                    rt = GetSecs - starttime;
                    break
                elseif KbName(keycode) == respKeys{2}
                    resp = 2;
                    rt = GetSecs - starttime;
                    break
                end
                WaitSecs(0.001); % prevent overload
            end
            
        case 7

            while GetSecs - starttime <= duration
                if GetSecs - starttime >= fhoffset && flag == true
                    fh(functioninputs);
                    flag = false;
                end
                if GetSecs - starttime >= fh2offset && flag2 == true
                    fh2(functioninputs);
                    flag2 = false;
                end
                [~,~,keycode] = KbCheck(-1);
                if KbName(keycode) == respKeys{1}
                    resp = 1;
                    rt = GetSecs - starttime;
                    break
                elseif KbName(keycode) == respKeys{2}
                    resp = 2;
                    rt = GetSecs - starttime;
                    break
                end
                WaitSecs(0.001); % prevent overload
            end
    end
end