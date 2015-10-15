function [D] = probDist(MeanVec, CovMatrix, N)

D = randmatrix(MeanVec, CovMatrix, N);

end

