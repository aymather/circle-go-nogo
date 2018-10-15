%   %   %   %   %   %   %   %   %   %   %   %   %   %   %   %   
% Trialcheck Program                                        %
% Written By: Alec Mather 2018                              %
%                                                           %
% Input 1 = trial sequence or block                         %
% Input 2 = the column that you want to check for           %
%                                                           %
% The purpose of this is to not have two of a nonzero       %
% element in a row (I use this to check to make sure there  %
% aren't two novelty trials in a row)                       %
%   %   %   %   %   %   %   %   %   %   %   %   %   %   %   %   

function trialseq = trialcheck(trialseq,stan)
    it = 1;
    while it < size(trialseq,1)
        
        if (trialseq(it,stan) == trialseq(it+1,stan) && trialseq(it,stan) + trialseq(it+1,stan) ~= 0) || (trialseq(it,stan) * trialseq(it+1,stan) > 0)
            trialseq = shuffle_me(trialseq,1);
            it = 1;
        else
            it = it + 1;
        end
        
    end
end