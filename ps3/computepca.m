function [ p, eig_val, eig_vec ] = computepca( data, d )

    [ E, ~ ] = eigs(data * data', d);
    p = E' * data;
    p = p';
    
end


