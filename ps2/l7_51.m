function l7_51()

N = 200; % number of points considered
t = rand(1,N);
t = sort((16/4)*pi*sqrt(t))'; 
z = (36/4)*pi*rand(N,1); % random heights
x = (t+.1).*cos(t);
y = -(t+.1).*sin(t);
data = [x,y,z]; % data of interest is in the form of a n-by-3 matrix

cmap = jet(N);
scatter3(x,y,z,20,cmap);

sigma = std2(data);

nn = 5;

w = zeros(N);

for j=1:N
    
    local_neighbors = zeros(N,1);
    
    for k=1:N
        exponent = (-1/sigma) * norm(data(j,:) - data(k,:))^2;
        local_neighbors(k) = exp(exponent);
    end

    [~, idx] = sort(local_neighbors);
    
    for k=1:N
        index = idx(k);
        if ~(k < nn)
            local_neighbors(index) = 0;
        end
    end
    
    w(1,:) = local_neighbors;
end

end

