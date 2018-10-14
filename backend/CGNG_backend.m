function trialseq = CGNG_backend(settings,data,id)

    % TRIALSEQ
    trialseq = CGNG_sequence(settings,data,id);

    % INTRO
    CGNG_intro(settings, trialseq, 1);
    
    for it = 1:size(trialseq,1)

        % Start time
        if it == 1
            starttime = GetSecs;
        end
        trialseq(it,id.time) = GetSecs - starttime;
        
        % Get a random iti
        iti = randi([800 1200],1,1)/1000;

        % Find random starting point
%         r = randi([1 size(settings.ring.xunit,2)],1,1) + size(settings.ring.xunit,2);
        r = settings.rng(it);
        
        % Get random path length
        pathLength = randi([80 110],1,1);

        % Preassign
        spin.xspinner = [];
        spin.yspinner = [];

        % Find path of stimulus (clockwise/counterclockwise)
        if trialseq(it,id.side) == 2 
            for ib = r:((size(settings.ring.xunit,2)/12) + r) + pathLength
                spin.xspinner = [spin.xspinner, settings.spinner_x(ib)];
                spin.yspinner = [spin.yspinner, settings.spinner_y(ib)];
            end
        else
            for ib = r:((size(settings.ring.xunit,2)/12) + r) + pathLength
                spin.xspinner = [settings.spinner_x(ib), spin.xspinner];
                spin.yspinner = [settings.spinner_y(ib), spin.yspinner];
            end
        end

        % Run Spinner
        [err, rt, resp, color, onset2change, color_change] = run_dots(settings, trialseq, id, spin, it, data);

        % Vanish
        Screen('FillRect', settings.screen.outwindow, settings.screen.bg);
        trialend = Screen('Flip', settings.screen.outwindow);
        WaitSecs(settings.durations.postSpin);
        SetMouse(settings.screen.outwindowdims(3)/2, settings.screen.outwindowdims(4)/2); %place mouse at the center of the screen

        ShowCursor;

        % Display Ring
        ring(settings);
        DrawFormattedText(settings.screen.outwindow, 'Where did the dot change color? (click)', 'center', settings.screen.outwindowdims(4)/5, settings.layout.color.text);
        Screen('Flip', settings.screen.outwindow);

        % Preassign
        buttons = 0;    

        % Wait for response
        while any(buttons) == false
            [x,y,buttons] = GetMouse(settings.screen.screenNumber);

            % Get distance from center to see if it's inside/outside the circle
            d = sqrt(((x - settings.draw.ring.x_loc)^2) + ((y - settings.draw.ring.y_loc)^2));
            if d < settings.circleCheck.radius || d > settings.draw.ring.radius
                buttons = false;
            end
        end

        % Hide Cursor again
        HideCursor;

        [xcord, ycord] = calcToCircle(settings,x,y);

        % Display participants answer and the correct answer
        ring(settings);
        Screen('FillOval',settings.screen.outwindow,settings.draw.dot.color,[(xcord-settings.draw.dot.radius) (ycord-settings.draw.dot.radius) (xcord+settings.draw.dot.radius) (ycord+settings.draw.dot.radius)]);
        Screen('FillOval',settings.screen.outwindow,color,[(err.x-settings.draw.dot.radius) (err.y-settings.draw.dot.radius) (err.x+settings.draw.dot.radius) (err.y+settings.draw.dot.radius)]);   
        Screen('Flip', settings.screen.outwindow);
        WaitSecs(settings.durations.memDisp);
        
        theta = calcAngle(x,y,err.x,err.y);
        
        % Gridlock your err.x and err.y
        [err_x, err_y] = calcToCircle(settings,err.x,err.y);
        
        % did the click happen clockwise in reference to the true value, or
        % counterclockwise in reference to the true value.
        sign = posOrNeg(settings,err_x,err_y,xcord,ycord);
        if sign == 0 
            trialseq(it,id.err) = -(theta); %counterclockwise
        else
            trialseq(it,id.err) = theta; %clockwise
        end

        % ITI
        Screen('FillRect', settings.screen.outwindow, settings.screen.bg);
        Screen('Flip', settings.screen.outwindow);
        WaitSecs(iti);
        
        if data.baseline == 0

            % Record rt/response: (resp == 1 == left :: resp == 2 == right)
            trialseq(it,id.rt) = rt; trialseq(it,id.resp) = resp;

            % Code accuracy(1 = correct, 2 = error, 3 = failsop, 4 = succstop, 99 =
            % miss)
            if trialseq(it,id.stan) == 0
                if trialseq(it,id.side) == trialseq(it,id.resp)
                    trialseq(it,id.acc) = 1; %correct
                elseif trialseq(it,id.resp) == 0
                    trialseq(it,id.acc) = 99; %miss
                elseif trialseq(it,id.side) ~= trialseq(it,id.resp) && trialseq(it,id.resp) ~= 0
                    trialseq(it,id.acc) = 2; 
                end
            else
                if trialseq(it,id.resp) ~= 0
                    trialseq(it,id.acc) = 3; %failed stop
                else
                    trialseq(it,id.acc) = 4; %successful stop
                end
            end 
        end
        
        % Write timestamps
        trialseq(it,id.onset2change) = onset2change;
        trialseq(it,id.change2vanish) = trialend - color_change;

        % Save
        save(fullfile(settings.files.outfolder, settings.files.outfile), 'trialseq', 'settings');

        % BLOCK BREAK
        if it == size(trialseq,1) || trialseq(it,id.block) ~= trialseq(it+1,id.block)
            CGNG_blockfeedback(settings,trialseq,it,id,data)
        end

        if it == size(trialseq,1)
            CGNG_outro(settings,trialseq,data)
        end

    end
    
end