function [ output_args ] = l6_45( input_args )
%L6_45 Summary of this function goes here
%   Detailed explanation goes here


end

function [ X ] = gen_input()
    z = zeros(10,10);
    o = ones(10,10);
    
    X = [ repmat(z, [1 2]) repmat(o, [1 2]) repmat(z, [1 4]) repmat(o, [1 4]) repmat(z, [1 2]) repmat(o, [1 2]) repmat(z, [1 2]) ];
end

