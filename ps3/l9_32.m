function l9_32()
MU1 = [5 5];
SIGMA1 = [0.75 0; 0 0.7];
MU2 = [3 3];
SIGMA2 = [0.75 0; 0 0.7];

D1 = probDist(MU1, SIGMA1, 100);
D2 = probDist(MU2, SIGMA2, 100);

figure;
hold on;
plot(D1(:,1), D1(:,2), '.');
plot(D2(:,1), D2(:,2), '.');
axis([ 0 7 0 7 ]);

hold off;
end
% function [ ] = L9S32( )
%   % L9S32 Summary of this function goes here
%   % Detailed explanation goes here
%    
%   Mu1 = [1.2, 1.2];
%   Cov1 = [0.8, 0; 0, 0.8];
%   NormalD1 = RandomGaussian(Mu1, Cov1, 100).';
%   Sigma1 = std(NormalD1(1, :));
%    
%   [W1, B1] = GaussDiscriminant(Mu1, Sigma1, 0.5);
%    
%   Mu2 = [4, 4];
%   Cov2 = [0.8, 0; 0, 0.8];
%   NormalD2 = RandomGaussian(Mu2, Cov2, 100).';
%   Sigma2 = std(NormalD2(1, :));
%    
%   [W2, B2] = GaussDiscriminant(Mu2, Sigma2, 0.5);
%    
%   x = 0:0.1:10;
%   y = 0:0.1:10;
%   [X, Y] = meshgrid(x, y);
%    
%   Results = [];
%    
%   for i = 1:100
%   for j = 1:100
%   x = X(i, j);
%   y = Y(i, j);
%    
%   R1 = (W1 * [x; y] + B1);
%   R2 = (W2 * [x; y] + B2);
%   Diff = abs(R1 - R2);
%    
%   if Diff < 0.2
%   Results = [Results, [x; y]];
%   end
%   end
%   end
%    
%   figure;
%   hold on;
%   plot(NormalD1(1, :), NormalD1(2, :), 'o');
%   plot(NormalD2(1, :), NormalD2(2, :), 'o');
%   plot(Results(1, :), Results(2, :), 'x');
%   title('Results');
%   hold off;
% 
% end

