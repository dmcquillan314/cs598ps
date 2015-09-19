function [ T ] = p3computedft( M )

    N = size(M,1);
    normN = sqrt(N);
    
    x = 0:N-1;
    y = 0:N-1;
    
    F = zeros(N,N);

    for j = 1:N
        for k = 1:N
            inner_part = (x(j) * y(k) * 2 * pi) / N;
            cos_part = cos(inner_part);
            sin_part = 1i * sin(inner_part);
            F(j, k) = (1 / normN) * (cos_part + sin_part);
        end
    end
    
    T = F * M * F; 
end

