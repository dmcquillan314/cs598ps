function l9_33()
MU1 = [1 1];
COV1 = [2 1; 1 1];
MU2 = [5 5];
COV2 = [0.8 0; 0 0.8];

D1 = probDist(MU1, COV1, 100);
D2 = probDist(MU2, COV2, 100);

[bw1, lw1, iw1] = gdiscriminant2(MU1.',COV1,0.5);
[bw2, lw2, iw2] = gdiscriminant2(MU2.',COV2,0.5);

x = -5:0.05:10;
y = -5:0.05:10;
[X, Y] = meshgrid(x, y);

RS1 = zeros(size(X));

for i = 1:300
    for j = 1:300
        x = X(i, j);
        y = Y(i, j);

        p = [x; y];

        R1 = (p.' * bw1 * p) + (lw1.' * p) + iw1;
        R2 = (p.' * bw2 * p) + (lw2.' * p) + iw2;

        if R1 < R2
            RS1(i, j) = 0;
        else
            RS1(i, j) = 1;
        end
    end
end

figure;
hold on;
contourf(X, Y, RS1, [0.5 0.5]);

plot(D1(:,1), D1(:,2), '.');
plot(D2(:,1), D2(:,2), '.');

axis square;
hold off;
end
