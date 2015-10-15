function [ G ] = gauss2d( size, x0, y0, sigma_x, sigma_y )
theta = pi / 4;
A = 1;
x0 = 0; y0 = 0;

sigma_x = 1;
sigma_y = 2;

[X, Y] = meshgrid(-5:.1:5, -5:.1:5);

    a = cos(theta)^2/2/sigma_x^2 + sin(theta)^2/2/sigma_y^2;
    b = -sin(2*theta)/4/sigma_x^2 + sin(2*theta)/4/sigma_y^2 ;
    c = sin(theta)^2/2/sigma_x^2 + cos(theta)^2/2/sigma_y^2;

    Z = A*exp( - (a*(X-x0).^2 + 2*b*(X-x0).*(Y-y0) + c*(Y-y0).^2)) ;

surf(X,Y,Z);shading interp;view(-36,36)
end

