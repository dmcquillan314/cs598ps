function l6_32(  )
faces = l5_faces();
    
    N = size(faces.X,2);
    M = 16;
    faces.X = faces.X(:,1:N) ./ 255;
    
    avg_face = mean(faces.X,2);
    
    cent_face_data = faces.X - repmat(avg_face, [1,N]);
    trans_cent_face_data = cent_face_data';
    
    [eig_vec, eig_val] = eigs(cov(trans_cent_face_data), M);
    
    figure;
    for i = 1:M
        subplot(4,4,i);
        imshow(reshape(eig_vec(:,i),faces.M,faces.N), []);
    end
    
    figure;
    X = eig_vec;
    
    eta = 1e-5;
    eps = 1e-7;
    
    N = size(X,1);
    W = eye(16);    
    
    k = 0;
    err = inf;
    maxIters = 1000;
    [d n] = size(X);
    
    while (k < maxIters)
        k = k + 1;
        Wlast = W;
        
        Y = X * W;
        
        del_W = ((N * eye(16)) - (Y' .^ 3) * Y)*W;
        W = W + eta * del_W;
        
        err = max(1 - dot(W,Wlast,2));
        disp(err);
    end
    
    Y = X * W;
    for i = 1:M
        subplot(4,4,i);
        imshow(reshape(Y(:,i),faces.M,faces.N), []);
    end
end

