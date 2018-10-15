function id = CGNG_full_columns

    id.trialNum = 1;
    id.block = 2;
    id.stan = 3; %0 = go, 1 = nogo
    id.side = 4; %clockwise or counterclockwise
    id.rt = 5; %reaction time
    id.resp = 6; 
    id.err = 7; %calculated click distance from actual angular error
    id.acc = 8; %Accuracy: 1=correct, 2=error, 3=failstop, 99=miss?
    id.time = 9;
    id.onset2change = 10;
    id.change2vanish = 11;
     
end