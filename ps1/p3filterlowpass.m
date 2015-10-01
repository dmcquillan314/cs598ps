function [ f ] = p3filterlowpass( x, M )
    filter_low = fir1(8, 1/M, 'low');
    filtered_x = conv(x,filter_low);
    f = filtered_x;
end

