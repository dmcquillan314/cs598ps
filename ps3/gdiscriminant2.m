function [ Big_W, Lit_W, It_W ] = gdiscriminant2( mu, covariance, p )    
    CovInv = inv(covariance);
    
    Big_W = -0.5 * (CovInv);
    Lit_W = (CovInv) * mu;
    
    Inner = mu.' * (CovInv) * mu + log2(det(covariance));
    It_W = (-0.5 * Inner) + log2(p);
end

