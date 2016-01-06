function l9_53()

faces = load('face2.mat');

p = computepca(faces.XX,2);

pn = normalize(p);

D1 = pn(logical(faces.g),:);
N1 = size(D1,1);
% MU1 = mean(D1);
% COV1 = cov(D1);

D2 = pn(~logical(faces.g),:);
N2 = size(D2,1);
% MU2 = mean(D2);
% COV2 = cov(D2);

% [bw1, lw1, iw1] = gdiscriminant2(MU1.',COV1,0.5);
% [bw2, lw2, iw2] = gdiscriminant2(MU2.',COV2,0.5);
% 
% l9_plotquad(D1,D2,bw1,bw2,lw1,lw2,iw1,iw2, 0, 1.001, 0.001);

[w,w0] = sgd([D1;D2], [ones(N1,1);(-1 * ones(N2,1))], 0.05, 2500);
Xax = 0:0.01:1; 
Yax=-(w0+Xax*w(1))/w(2);

figure;
hold on;
scatter(D1(:,1),D1(:,2))
scatter(D2(:,1),D2(:,2))
plot(Xax,Yax);

end
