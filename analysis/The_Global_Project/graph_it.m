function graph_it(leg, lim, xlab, ylab, values, errors)

    
    % This function graphs data with specified error bars
    % This function can handle up to 4 separate factors with unlimited
    % levels of those factors.
    %
    % How to form inputs:
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    %                                                                       %
    % leg == Legend                                                         %
    % Example: leg = {'Factor 1','Factor 2','Factor 3','Factor 4'}          %
    %                                                                       %
    % lim == Y Limit on your graph                                          %
    % Example: y = 500                                                      % 
    %                                                                       %
    % xlab == X Label on graph                                              %
    % Example: x = {'Levels'}                                               %
    %                                                                       %
    % ylab == Y Label on graph                                              % 
    % Example: y = {'Mean RT'}                                              %
    %                                                                       %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    %
    % Values and Errors setup (they exist in the same form):
    %
    % Values is an N by X matrix where your rows(N) will be plotted
    %   along the 'x' axis, and your columns(X) will be related to 
    %   information given in the legend (i.e. bars per group on 'x' axis)
    %
    % AKA:
    %
    %   Each column represents a Factor
    %   Each row represents a level of that factor
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    % 
    % BUG WARNING:
    %
    % This function has a bug that is created in the source code of
    % MATLAB's bar() function. When you plot a graph with only one level
    % and multiple factors, it groups them as the same level. This function
    % corrects for that by adding a psudo level so that the legend will
    % accurately reflect the factors, however, there will be a default of 2
    % levels for the 1 factor.
    %
    % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
    
    % GET VALUES

    if size(values,1) == 1
        values = [values;zeros(1,size(values,2))];
        errors = [errors;zeros(1,size(errors,2))];
    end

    % MAKE GRAPHS
    g = figure('Position',[1 1 1200 400],'PaperPositionMode','auto','Visible','on');
    g = bar(values);
    hold on
    X = [];
    for i = 1:length(g)
        X = [X; g(i).XData + g(i).XOffset];
    end
    X = X';
    EB = errorbar(X,values,errors,'.');
    legend(leg);
    xlabel(xlab);
    ylabel(ylab);
    ylim([0 lim]);
    hold off
    
end