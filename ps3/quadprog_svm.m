function [ w, b ] = quadprog_svm( x, y, C)

    % some normalization of inputs
    [n,m] = size(x);
    if n < m
        x = x';
        [n,m] = size(x);
    end
    
    if sum(y == 0) > 0
        y(y == 0) = -1;
    end
    
    if isequal(nargin, 2) 
        C = 0;
    end
    
    z = y(:);  % must be column vector


    % using kuhn tucker theorem convert problem to
    % maximize L(alpha) = 
    %           sum(1,n)(alpha_i) -
    %           1/2*alpha'Halpha
    % constrained to alpha_i >= 0 and sum(1,n)(alpha_i*z_i) = 0
    
    H = (x * x') .* (z * z');
    
    % matlab expects quadratic programming to be stated in canonical
    % (standard) form which is 
    % minimize P(x) = 0.5x'Hx + f'x
    % constrained to Ax <= a and Bx = b
    % where A, B, H are n by n matrices and f, a, b are vectors
    
    % convert optimization problem to canonical form by multiplying by -1
    
    f = -1 * ones(n,1);
    
    % then we have the following optimization problem
    % minimize L(alpha) = f'alpha + 1/2alpha'Halpha
    
    % first constraint is alpha_i >= 0
    A = -1 * eye(n);
    a = zeros(n,1);
    
    % second constraint is sum(1,n)(alpha_i*z_i) = 0
    B = [ z'; zeros(n-1,n) ];
    b = zeros(n,1);
    
    alpha = quadprog(H+eye(n)*C,f,A,a,B,b);
    
    % find w  using w = sum(1,n)(alpha_i*z_i*x_i = (alpha.*z)'*x
    w = (alpha .* z)' * x;
    
    nz_ind = find(alpha>1e-5);
    fnz_ind = nz_ind(1);
    
    w_0 = 1/z(fnz_ind) - w * x(fnz_ind,:)';
    b = w_0;
end

