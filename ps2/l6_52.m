function l6_52(  )
    [ data, v ] = video_data('hands.mp4');
    [ E, D ] = eigs(data * data', 3);

    
    X = E' * data;
    X = X';
    eta = 1e-5;
    eps = 1e-7;
    
    [N,M] = size(X);
    w = eye(M);
    
    maxiter = 100;
    k = 0;
    while(k < maxiter)
        Y = X * w;
        wlast = w;
        T = zeros(size(Y));
        [s,t] = size(Y);
        
        for i=1:s
            for j = 1:t
                T(i,j) = tanh(Y(i,j));
            end
        end
        
        Y = T;
                        
        g = pinv(w');
        
        g = g - (X' * Y * (2/N));
        
        w = w + eta * g;
        
        k = k + 1;
        
    end
    
    ica_coeff = data * X * w;
    figure;
    
    subplot(2,3,1);
    imshow(reshape(ica_coeff(:,1), v.Height, v.Width), []);
    
    subplot(2,3,2);
    imshow(reshape(ica_coeff(:,2), v.Height, v.Width), []);
    
    subplot(2,3,3);
    imshow(reshape(ica_coeff(:,3), v.Height, v.Width), []);
    
    V = ica_coeff' * data;   
    subplot(2,3,4);
    plot(V(1,:));

    subplot(2,3,5);
    plot(V(2,:));

    subplot(2,3,6);
    plot(V(3,:));

end

