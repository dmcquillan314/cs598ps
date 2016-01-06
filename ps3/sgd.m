function [ w, b ] = sgd( data, classifications, eta, max_iter )

    if nargin < 4
        max_iter = 1800;
    end
    
    y = classifications(:); % assure it is a column vector
    
    [n,m] = size(data);
    
    if(n < m)
        % normalize so that samples are rows
        data = data';
        [n,m] = size(data);
    end
    
    if sum(classifications == 0) > 0
        y(classifications == 0) = -1;
    end

    it = 0;
    diff = -1;
    
    threshold = 0.005;
    w = randn(m+1,1);
    
    while(it < max_iter && (isequal(diff,-1) || diff > threshold))
        
        wlast = w;
        
        for j = 1:n
            X = [data(j,:).'; 1];
            
            if(~(sign(w.'*X) == y(j)))
                w = w + eta * y(j) * X;
            end
        end
        
        diff = norm(wlast - w);
        
        it = it + 1;
        
    end
    
    b = w(end);
    w = w(1:end-1);
end

