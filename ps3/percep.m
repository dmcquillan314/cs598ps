function [ w ] = percep( X, y )
    % n d-dimensional column vectors
    [d, n] = size(X);
    max_it = 10000;
    eta = 0.05;
    
    if sum(y == 0) > 0
        y(y == 0) = -1;
    end


    w0 = randn(1,2);
    w = w0';
    it = 0;

    errors = n;

    while(errors > 0) && (it < max_it)
        it = it + 1;
        errors = 0;
        gradient = zeros(d,1);

        % computation of gradient
        for i = 1:n
            if((X(:,i)'*w) * y(i) < 0) 
                errors = errors + 1;
                gradient = gradient + eta * ( -1 * y(i) * X(:,i));
            end
        end

        w = w - eta * gradient;
    end
end

