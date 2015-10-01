function l6_22()
    figure;
    r1 = rand_uniform_points(-1,1,1000);
    r2 = rand_uniform_points(-1,1,1000);
    x = 2 * r1 + r2;
    y = r1 + r2;
    
    X = [x y];
    
    subplot(2,2,1);
    plot(x,y,'.');
    
    P = compute_pca(X);
    
    subplot(2,2,2);
    plot(P(:,1),P(:,2),'.');
   
    eta = 1e-5;
    eps = 1e-7;
    
    N = size(X,1);
    W = eye(2);    
    
    k = 0;
    err = inf;
    maxIters = 130;
    [d n] = size(P);
    
    while (k < maxIters)
        k = k + 1;
        Wlast = W;
        
        Y = X * W;
        
        del_W = ((N * eye(2)) - (Y' .^ 3) * Y)*W;
        W = W + eta * del_W;
        
        err = max(1 - dot(W,Wlast,2));
        disp(err);
    end
    
    Y = X * W;
    subplot(2,2,4);
    plot(Y(:,1),Y(:,2),'.');
end

function [P] = compute_pca(x)
    [V D] = eig(cov(x));
    P = x * V;
end
