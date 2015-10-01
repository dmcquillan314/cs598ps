function [r] = rand_uniform_points(a,b, N)
    r = a + (b-a).*rand(N,1);
end