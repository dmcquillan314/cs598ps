function [ s ] = randmatrix( mu,Sigma,K )

mu=repmat(mu,K,1);

[n,d]=size(mu);

U=chol(Sigma);

s = randn(n,d)*U + mu;

end

