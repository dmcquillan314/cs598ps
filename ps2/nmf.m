function [w,h]=nmf(X, r, niter)
    
    [m,n] = size(X);

    w0=rand(m,r);
    h0=rand(r,n);
    
    for it=1:niter
        
        numer = w0'*X;
        h = max(0,h0 .* (numer ./ ((w0'*w0)*h0 + eps(numer))));
        numer = X*h';
        w = max(0,w0 .* (numer ./ (w0*(h*h') + eps(numer))));

        dw = max(1 - dot(w0,w,2));
        dh = max(1 - dot(h0,h,2));
        disp(dw);
        disp(dh);
        
        w0 = w;
        h0 = h;
    end
end