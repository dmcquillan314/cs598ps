function [ f ] = p3filterlowpass( x, M )
    filter_low = fir1(8, 1/M, 'low');
    filtered_x = filter(filter_low,1,x);
    f = filtered_x;
end

