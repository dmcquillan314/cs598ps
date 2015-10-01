function l6_22()
    figure;
    r1 = rand_uniform_points(-1,1,100);
    r2 = rand_uniform_points(-1,1,100);
    x = 2 * r1 + r2;
    y = r1 + r2;
    
    Z = [x y];
    
    subplot(1,2,1);
    plot(x,y,'.');
    
    eta = 1e-5;
    eps = 1e-7;
    
    N = size(Z,1);
    W = eye(N);
 
    for k = 1:10
        Y = Wi * x;
        del_W = ((N * eye(N)) - (Y.^3 * y'))*W;
        W = W + eta * del_W;
    end
    
    Y = W * x;
    subplot(1,2,2);
    plot(Y(:,1),Y(:,2),'.');
end

function [x] = kernel_22(x)
    z = x.^3;
end
