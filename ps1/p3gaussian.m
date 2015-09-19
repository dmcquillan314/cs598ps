function [ G ] = p3gaussian( size, sigma )
    
    N = 1.0;
    x=linspace(-N, N, size);
    y=x;
    [X,Y]=meshgrid(x,y);
    
    sigma_x = sqrt(sigma);
    sigma_y = sqrt(sigma);
        
    z= exp(-(X.^2/(2 * sigma_x^2))-(Y.^2/(2 * sigma_y^2)));
    
    sum_z = sum(sum(z));
    G = z ./ sum_z;
end

