function [ T ] = computedft( M )

    [n,m] = size(M);
    normN = sqrt(n);
    
    x = 0:n-1;
    y = 0:m-1;
    
    F = zeros(n,m);

    for j = 1:n
        for k = 1:m
            inner_part = (x(j) * y(k) * 2 * pi) / n;
            cos_part = cos(inner_part);
            sin_part = 1i * sin(inner_part);
            F(j, k) = (1 / normN) * (cos_part + sin_part);
        end
    end
    
    T = reshape(kron(F',F) * vec(M), n, m); 
end