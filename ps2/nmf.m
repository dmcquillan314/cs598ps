function [w,h]=nmf(v,r,verbose)

[n,m]=size(v);
stopconv=40;      % stopping criterion (can be adjusted)
niter = 2000;     % maximum number of iterations (can be adjusted)

cons=zeros(m,m);
consold=cons;
inc=0;
j=0;

%
% initialize random w and h
%
w=rand(n,r);
h=rand(r,m); 


for i=1:niter

    % divergence-reducing NMF iterations

    x1=repmat(sum(w,1)',1,m);
    h=h.*(w'*(v./(w*h)))./x1;
    x2=repmat(sum(h,2)',n,1);
    w=w.*((v./(w*h))*h')./x2;

    % test convergence every 10 iterations

    if(mod(i,10)==0)  
        j=j+1;

    % adjust small values to avoid undeflow
    h=max(h,eps);w=max(w,eps);

    % construct connectivity matrix
    [y,index]=max(h,[],1);   %find largest factor
    mat1=repmat(index,m,1);  % spread index down
    mat2=repmat(index',1,m); % spread index right
    cons=mat1==mat2;

    if(sum(sum(cons~=consold))==0) % connectivity matrix has not changed
        inc=inc+1;                     %accumulate count 
    else
        inc=0;                         % else restart count
    end
    if verbose                     % prints number of changing elements 
        fprintf('\t%d\t%d\t%d\n',i,inc,sum(sum(cons~=consold))), 
    end

    if(inc>stopconv)
        break,                % assume convergence is connectivity stops changing 
    end 

    consold=cons;

end
end