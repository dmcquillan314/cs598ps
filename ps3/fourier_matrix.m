function [ F ] = fourier_matrix( N )

F = zeros(N,N);
norm = sqrt(N);

for j = 1:N
    for k = 1:N
        c = ((j - 1) * (k - 1) * 2 * pi) / N;
        F(j, k) = (1 / norm) * ( cos(c) + 1i * sin( c ) );
    end
end

end

