function l9_plotquad(D1, D2, bw1, bw2, lw1, lw2, iw1, iw2, lb, ub, step)

if(nargin < 11)
    lb = -5;
    ub = 10;
    step = 0.05;
end
x = lb:step:ub;
y = lb:step:ub;
[X, Y] = meshgrid(x, y);

Mesh = zeros(size(X));

[n,m] = size(Mesh);

for i = 1:n
    for j = 1:m
        x = X(i, j); y = Y(i, j); p = [x; y];

        lval = (p.' * bw1 * p) + (lw1.' * p) + iw1;
        rval = (p.' * bw2 * p) + (lw2.' * p) + iw2;

        if lval < rval
            Mesh(i, j) = 0;
        else
            Mesh(i, j) = 1;
        end
    end
end

figure;
hold on;
contourf(X, Y, Mesh, [0.5 0.5]);

plot(D1(:,1), D1(:,2), '.');
plot(D2(:,1), D2(:,2), '.');

axis square;
hold off;


end

