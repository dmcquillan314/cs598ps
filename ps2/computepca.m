function [ p, eig_val, eig_vec ] = computepca( X )

    [ U, S, V ] = svd(X*X');
    
    eig_val = diag(S);
    eig_vec = V;

    W = U * pinv(sqrt(S)) * V';
    p = W * X;
    
end

