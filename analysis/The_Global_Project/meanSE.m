function matrix = meanSE(matrix,dimension)

    % Written By: Alec Mather
    %
    % This program will add two extra rows or columns along your matrix in
    % the first or second dimensions, the first extra row/column will be
    % the mean of all the elements along that axis, and the second
    % row/column will be the SE of all the elements along that axis.
    %
    % Inputs:
    %
    %   matrix == matrix of any size
    %   dimension (int) (1 || 2) == matrix dimension along which to group
    %   data.
    %       1 == along first dimension
    %       2 == along second dimension

    switch dimension
        
        case 1
            
            addition = zeros(2,size(matrix,2));
            length = size(matrix,1);
            matrix = [matrix;addition];
            for it = 1:size(matrix,2)
                matrix(length+1,it) = mean(matrix(1:length,it));
                matrix(length+2,it) = std(matrix(1:length,it)) / sqrt(length);
            end
            
        case 2
            
            addition = zeros(size(matrix,1),2);
            length = size(matrix,2);
            matrix = [matrix,addition];
            for it = 1:size(matrix,1)
                matrix(it,length+1) = mean(matrix(it,1:length));
                matrix(it,length+2) = std(matrix(it,1:length)) / sqrt(length);
            end
    end
end