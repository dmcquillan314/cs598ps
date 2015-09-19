function [ R, M ] = p1Transform( imgPath, resReductionFactor )
%P1TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
    M = double(imresize(imread(imgPath), resReductionFactor));
    [vertDim, horDim, colorDim] = size(M);

    color_remove_green = [1 0 1];
    i_hor = ones(1, horDim);
    
    % TODO: is there a better way to do this?
    vert_trans_matrix = zeros(vertDim);
    
    for i = 1:vertDim
        for j = 1:vertDim
            if isequal(i,j) && j <= (vertDim / 2)
                vert_trans_matrix(i,j + round(vertDim / 2)) = 1;
                vert_trans_matrix(i + round(vertDim / 2), j) = 1;
            end 
        end
    end
    
    color_trans_matrix = diag(color_remove_green);
    hor_trans_matrix = [diag(i_hor); rot90(diag(i_hor)) ];
    
    kron_prod_color_vert = kron(color_trans_matrix,hor_trans_matrix);
    kron_prod_color_vert_hor = kron(kron_prod_color_vert, vert_trans_matrix);
    
    R = uint8(reshape(kron_prod_color_vert_hor * vec(M), vertDim, horDim * 2, colorDim));
end

