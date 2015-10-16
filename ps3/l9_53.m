function l9_53()

faces = load('face2.mat');

p = computepca(faces.XX,2);

pn = normalize(p);

D1 = pn(logical(faces.g),:);
MU1 = mean(D1);
COV1 = cov(D1);

D2 = pn(~logical(faces.g),:);
MU2 = mean(D2);
COV2 = cov(D2);

[bw1, lw1, iw1] = gdiscriminant2(MU1.',COV1,0.5);
[bw2, lw2, iw2] = gdiscriminant2(MU2.',COV2,0.5);

x = 0:0.001:1.001;
y = 0:0.001:1.001;
[X, Y] = meshgrid(x, y);

RS1 = zeros(size(X));

for i = 1:1001
    for j = 1:1001
        x = X(i, j);
        y = Y(i, j);

        p = [x; y];

        R1 = (p.' * bw1 * p) + (lw1.' * p) + iw1;
        R2 = (p.' * bw2 * p) + (lw2.' * p) + iw2;

        if R1 < R2
            RS1(i, j) = -1;
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

hold off;


end
