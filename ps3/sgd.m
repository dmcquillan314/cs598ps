function [ w, theta ] = sgd( data, classifications, eta, max_iter )

    if nargin < 4
        max_iter = 100;
    end
    
    y = classifications(:); % assure it is a column vector
    
    if sum(classifications == 0) > 0
        y(classifications == 0) = -1;
    end

    [n,d] = size(data);
    w = ones(n,1);    
    w = w(:);
        
    % set up bias weight
    w = [ w; 0.0 ];
    data = [ data; ones(1, d) ];

    it = 0;
    mse = 0;
    
    while it < max_iter
             
        mse = 0.0;
        
        for j=1:d
            x_i = data(:,j);
            x_i = x_i(:);
            
            wc = w;
            w = wc - eta * (x_i * (wc' * x_i - y(j)));
            mse = mse + (w' * x_i - y(j)) ^ 2;

        end
        
        mse = mse / d;
        
        %disp(mse);
        
        it = it + 1;
    end

    theta = w(end);
    w = w(1:end-1);
end

