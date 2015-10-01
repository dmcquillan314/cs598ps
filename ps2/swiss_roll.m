function [ data ] = swiss_roll( N )
t = rand(1,N);
t = sort(4*pi*sqrt(t))';
z = 8*pi*rand(N,1); % random heights
x = (t+.1).*cos(t);
y = (t+.1).*sin(t);
data = [x,y,z];
    
end

