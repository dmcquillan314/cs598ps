function l9_plotlinear( D1, D2, w1, w2, b1, b2 )

x = 0:0.1:10;
y = 0:0.1:10;
[X, Y] = meshgrid(x, y);

Mesh = zeros(size(X));
[n,m] = size(Mesh);
for i = 1:n
    for j = 1:m
        x = X(i, j);
        y = Y(i, j);

        lval = (w1 * [x; y] + b1);
        rval = (w2 * [x; y] + b2);

        if lval > rval
            Mesh(i,j) = 1;
        else
            Mesh(i,j) = -1;
        end
    end
end

figure;
hold on;
contourf(X, Y, Mesh, [0.5 0.5]);
plot(D1(:,1), D1(:,2), '.');
plot(D2(:,1), D2(:,2), '.');
axis([ 0 10 0 10 ]);

title('Results');
hold off;

end

