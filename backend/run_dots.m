function [err, rt, resp, color, onset2change, color_change] = run_dots(settings, trialseq, id, spin, it, data)
    
    % Hide Cursor
    HideCursor;

    % Preassign
    rt = 0; resp = 0;

    % Set flag to stop checking for mouse response
    flag = true; flag1 = true;
    
    % Throw up ring for 500ms
    ring(settings);
    DrawFormattedText(settings.screen.outwindow, '+', 'center', 'center', settings.layout.color.text);
    Screen('Flip', settings.screen.outwindow);
    WaitSecs(settings.durations.preRing);
    
    color = settings.draw.dot.color;
            
        % Gather change starting point
        r = randi([round(size(spin.xspinner,2)/4) round((size(spin.xspinner,2)/4))*3],1,1);

        % Get x,y coordinate of changer
        err.x = spin.xspinner(r);
        err.y = spin.yspinner(r);

        % for memory response trials
        for kk = 1:size(spin.xspinner,2)

            % Spin the Wheel :)
            if kk == 1
                trialstart = ring(settings);
            else
                if kk > r
                    if data.baseline == 0 && trialseq(it,id.stan) == 0
                        color = settings.draw.dot.color_go;
                    elseif data.baseline == 0 && trialseq(it,id.stan) == 1
                        color = settings.draw.dot.color_nogo;
                    else
                        color = settings.draw.dot.color_change;
                    end    
                    if flag == true && kk > r && flag1 == true
                        color_change = GetSecs;
                        flag1 = false;
                        flag = false;
                    end
                end
                ring(settings);
                DrawFormattedText(settings.screen.outwindow, '+', 'center', 'center', settings.layout.color.text);
                Screen('FillOval',settings.screen.outwindow,color,[(spin.xspinner(kk)-settings.draw.dot.radius) (spin.yspinner(kk)-settings.draw.dot.radius) (spin.xspinner(kk)+settings.draw.dot.radius) (spin.yspinner(kk)+settings.draw.dot.radius)]);
                Screen('Flip', settings.screen.outwindow);
                WaitSecs(settings.dotTime/1000);
            end

            if flag == false
                % Check mouse
                [~,~,buttons] = GetMouse;
                if any(buttons)
                    rt = GetSecs - color_change;
                    resp = find(buttons);
                    if resp == 3
                        resp = 2;
                    end
                    flag = true;
                end
            end
        end

    onset2change = color_change - trialstart;
    
end










