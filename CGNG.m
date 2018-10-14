%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%   QiYang, University of Iowa, September 2018                            %  
%   Program written by Alec Mather                                        %  
%                                                                         %
%   Psychtoolbox 3.0.12 / Matlab 2015a                                    %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
% CLEAR
clear;clc     

% MacOS Specific        
Screen('Preference', 'SkipSyncTests', 1);   
    
% GET PATH
addpath(genpath(fileparts(which('CGNG.m')))); 

% COLLECT DATA
data = CGNG_data;     
      
% DATA COLUMNS
id = CGNG_columns;        

% SETTINGS          
settings = CGNG_init(data);
  
% Go Through Trials
trialseq = CGNG_backend(settings,data,id);       
 
Screen('CloseAll');

  
