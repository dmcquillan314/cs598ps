function [ G ] = p4gaussian()
    
    N = 3.0;
    x=linspace(-N, N);
    y=x;
    [X,Y]=meshgrid(x,y);
    
    sigma_x = sqrt(1.5);
    sigma_y = sqrt(0.002);
    a = 1 / (sigma_x * sqrt(2 * pi));
        
    z= exp(-(X.^2/(2 * sigma_x^2))-(Y.^2/(2 * sigma_y^2)));
    
    G = (a / 8000) * z;
    
end

