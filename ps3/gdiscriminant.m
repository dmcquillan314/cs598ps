function [ w, b ] = gdiscriminant(mu, std_dev, p)   
    w = mu / (std_dev * std_dev);
    b = -(mu * mu.') / (2 * std_dev * std_dev) + log2(p); 
end

