function data = CGNG_data

disp('Welcome to our Experiment!');
data.nr = input('Subject Number: ');
data.training = input('Training?: (0/1) ');
data.baseline = input('Memory Baseline? (0/1): ');
if data.baseline == 0
    data.colors = input('Colors? (0/1): ');
end
if data.training == 0
    data.age = input('Age? ');
    data.gender = input('Gender? (m/f) ','s');
    data.hand = input('Handedness? (r/l) ','s');
end

% data.nr = 999;
% data.training = 0;
% data.colors = 1;
% data.baseline = 1;