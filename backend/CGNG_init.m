function settings = CGNG_init(data)

% Reset RNG
rng(sum(100*clock),'twister');

% Screen
settings.screen.bg = [90 90 90];

if data.baseline == 0
    % General
    if data.training == 0
        settings.general.blocks = 8;
        settings.general.trials = 54; % number of trials per block
        settings.general.go = 2/3;
        settings.general.nogo = 1/3;
        settings.general.side = 1/2;
    else
        settings.general.blocks = 1;
        settings.general.trials = 12;
        settings.general.go = 2/3;
        settings.general.nogo = 1/3;
        settings.general.side = 1/2;
    end
else
    if data.training == 0
        settings.general.blocks = 3;
        settings.general.trials = 48;
        settings.general.side = 1/2;
    else
        settings.general.blocks = 1;
        settings.general.trials = 6;
        settings.general.side = 1/2;
    end
end

% SIZE
settings.layout.size.text = 70;
settings.layout.size.blockfeedback = 90;

% COLOR
settings.layout.color.intro = [255 255 255];
settings.layout.color.text = [255 255 255];

% Screen Setup
screens = Screen('Screens');
settings.screen.screenNumber = max(screens);
[settings.screen.outwindow, settings.screen.outwindowdims] = Screen('OpenWindow', settings.screen.screenNumber, settings.screen.bg);% make screen, black bg
Priority(MaxPriority(settings.screen.outwindow)); % prioritize

% Draw ring
settings.draw.ring.color = [255 255 255];
settings.draw.ring.x_loc = settings.screen.outwindowdims(3)/2;
settings.draw.ring.y_loc = settings.screen.outwindowdims(4)/2;
settings.draw.ring.radius = 225;
settings.draw.ring.penWidth = 60;
settings.circleCheck.radius = settings.draw.ring.radius - settings.draw.ring.penWidth;

% Durations
settings.durations.memDisp = 1;
settings.durations.postSpin = 1;
settings.durations.preRing = .5;

% Ring used to make gridlock (radius is halfway between penWidth of Ring)
settings.plotRing.radius = settings.draw.ring.radius - (settings.draw.ring.penWidth/2);
[xunit, yunit] = plot_circle(settings.draw.ring.x_loc,settings.draw.ring.y_loc,settings.plotRing.radius);
settings.points = zeros(size(xunit,2),2);
settings.points(:,1) = xunit';
settings.points(:,2) = yunit';



% Dot Colors / properties
settings.draw.dot.color = [0 0 0];
if data.baseline == 0
    if data.colors == 0
        settings.draw.dot.color_nogo = [255 165 0];
        settings.draw.dot.color_go = [255 0 255];
    else
        settings.draw.dot.color_nogo = [255 0 255];
        settings.draw.dot.color_go = [255 165 0];
    end 
else
    settings.draw.dot.color_change = [255 128 128];
end
settings.draw.dot.radius = settings.draw.ring.penWidth/2;

% Block display
settings.blockdisp.blocknum = settings.screen.outwindowdims(4)/6 * 1;
settings.blockdisp.rt = settings.screen.outwindowdims(4)/6 * 2;
settings.blockdisp.failstop = settings.screen.outwindowdims(4)/6 * 3;
settings.blockdisp.missError = settings.screen.outwindowdims(4)/6 * 4;
settings.blockdisp.succstop = settings.screen.outwindowdims(4)/6 * 5;

% Spinner
% Plot invisible ring for dot paths
[settings.ring.xunit, settings.ring.yunit] = plot_circle_for_rundots(settings.draw.ring.x_loc,settings.draw.ring.y_loc,settings.plotRing.radius);
settings.spinner_x = [settings.ring.xunit, settings.ring.xunit, settings.ring.xunit];
settings.spinner_y = [settings.ring.yunit, settings.ring.yunit, settings.ring.yunit];

settings.rng = randperm(size(settings.ring.xunit,2));
settings.rng = [settings.rng,settings.rng,settings.rng,settings.rng,settings.rng];

% Define dot per spot (this will change based on the randomly generated pathLength)
settings.spinTime = 1000;
settings.dotTime = settings.spinTime/size(settings.ring.xunit,2);

% Save
settings.files.infolder = fileparts(which('CGNG.m'));
if data.baseline == 0
    settings.files.outfolder = fullfile(fileparts(which('CGNG.m')),'out',filesep);
else
    settings.files.outfolder = fullfile(fileparts(which('CGNG.m')),'baseline_out',filesep);
end
clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
settings.files.outfile = ['Subject_' num2str(data.nr) '_' date '_' hrs '.' mins 'h.mat'];





