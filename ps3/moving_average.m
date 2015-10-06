function [ y ] = moving_average( x, w )
    n_o = ones(1,w) / w;
    y = conv(x, n_o, 'same');
end

