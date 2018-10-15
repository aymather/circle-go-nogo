function sem = sem(values)

    sem = std(values(1:end,:)) / sqrt(size(values,1)*size(values,2));
    
end