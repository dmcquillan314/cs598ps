function [ Y, v ] = laplacian_eigenmap(data, k, sigma)
    N = size(data, 1);
    knn    = k; 
    sigma2 = sigma ^ 2; 

    m                = size(data,1);
    dt               = compute_dist(data);
    [srtdDt,srtdIdx] = sort(dt,'ascend');
    dt               = srtdDt(1:knn+1,:);
    nidx             = srtdIdx(1:knn+1,:);

    % compute weights
    tempW  = exp(-dt.^2/sigma2); 

    % build weight matrix
    i = repmat(1:m,knn+1,1);
    W = sparse(i(:),double(nidx(:)),tempW(:),m,m); 
    W = max(W,W'); % for undirected graph.

    % The original normalized graph Laplacian, non-corrected for density
    ld = diag(sum(W,2).^(-1/2));
    DO = ld*W*ld;
    DO = max(DO,DO');%(DO + DO')/2;

    % get eigenvectors
    [v,d] = eigs(DO,10,'la');
    
    Y = [ v(:,2), v(:,4) ];
end


function [distanceMatrix] = compute_dist(X)
    X = double(X);
    [n,p] = size(X);
    
    distances = zeros(1,n*(n-1)./2);
    k = 1;
    for i = 1:n-1
        dsq = zeros(n-i,1);
        for q = 1:p
            dsq = dsq + (X(i,q) - X((i+1):n,q)).^2;
        end
        distances(k:(k+n-i-1)) = sqrt(dsq);
        k = k + (n-i);
    end
    
    Y = distances;
    [m, n] = size(Y);
    if m~=1
        Y = Y';
        n = m;
    end
    
    m = ceil(sqrt(2*n));
    
    Z = zeros(m);
    if m>1
        % since matrix should be symmetric we can take the lower triangular part only and duplicate it
        Z(tril(true(m),-1)) = Y;  
        Z = Z + Z';
    end
    
    distanceMatrix = Z;
      
end

