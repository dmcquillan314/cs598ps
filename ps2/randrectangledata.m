function [ r ] = randrectangledata( x0, y0, w, h, n )

    x = x0+w.*rand(n,1);
    y = y0+h.*rand(n,1);
    r = [x y];
end

