function [ z ] = gauss2d(mu, covariance, N)
    %   RandGaussianMatrix Summary of this function goes here
    %   Detailed explanation goes here
    C = chol(covariance);
    
    z = repmat(mu, N, 1) + randn(N, 2) * C;
end

