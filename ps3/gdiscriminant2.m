function [ Big_W, Lit_W, It_W ] = gdiscriminant2( mu, covariance, p )    
    
    Big_W = -0.5 * (inv(covariance));
    Lit_W = (inv(covariance)) * mu;
    It_W = (-0.5 * (mu.' * (inv(covariance)) * mu + log2(det(covariance)))) + log2(p);
end

