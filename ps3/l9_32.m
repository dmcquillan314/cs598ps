function l9_32()
MU1 = [3 3];
COV1 = [0.75 0; 0 0.75];
MU2 = [6 6];
COV2 = [0.75 0; 0 0.75];
rng default;
D1 = probDist(MU1, COV1, 100).';
std_d1 = std(D1(1,:));

D2 = probDist(MU2, COV2, 100).';
std_d2 = std(D2(1,:));

D1 = D1.';
D2 = D2.';

[w1, b1] = gdiscriminant(MU1, std_d1, 0.5);
[w2, b2] = gdiscriminant(MU2, std_d2, 0.5);

x = 0:0.1:10;
y = 0:0.1:10;
[X, Y] = meshgrid(x, y);

RS1 = zeros(size(X));

for i = 1:100
    for j = 1:100
        x = X(i, j);
        y = Y(i, j);

        R1 = (w1 * [x; y] + b1);
        R2 = (w2 * [x; y] + b2);

        if R1 > R2
            RS1(i,j) = 1;
        else
            RS1(i,j) = -1;
        end
    end
end

figure;
hold on;
contourf(X, Y, RS1, [0.5 0.5]);
plot(D1(:,1), D1(:,2), '.');
plot(D2(:,1), D2(:,2), '.');
axis([ 0 10 0 10 ]);

title('Results');
hold off;

end