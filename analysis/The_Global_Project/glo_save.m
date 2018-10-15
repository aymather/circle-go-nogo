function [infolder, outfolder, outfile] = glo_save(infolder, outfolder, subject)
    
    %
    % Program written by: Alec Mather
    %
    % This function creates a templated save file.
    %
    % Inputs:
    %   
    %   infolder(str) == name of shell script
    %   outfolder(str) == name of outfolder (must be in same folder as
    %   shell)
    %   subject(int) == subject number
    %

    infolder = fileparts(which(infolder));
    outfolder = fullfile(fileparts(which(infolder)),outfolder,filesep);
    clocktime = clock; hrs = num2str(clocktime(4)); mins = num2str(clocktime(5));
    outfile = ['Subject_' num2str(subject) '_' date '_' hrs '.' mins 'h.mat'];

end