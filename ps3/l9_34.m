function l9_34()
MU1 = [5 5];
SIGMA1 = [0.75 0; 0 0.7];
MU2 = [3 6];
SIGMA2 = [0.75 0; 0 0.7];

D1 = probDist(MU1, SIGMA1, 100);
D2 = probDist(MU2, SIGMA2, 100);

figure;
hold on;
plot(D1(:,1), D1(:,2), '.');
plot(D2(:,1), D2(:,2), '.');
axis([ 0 6 0 11 ]);

hold off;
end
