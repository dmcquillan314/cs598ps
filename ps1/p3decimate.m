function [ o ] = p3decimate( x, M )

    N = length(x);
    decn = round(N / M);
    
    dec = ones(1,decn);
    
    for i = 1:decn
        lower = 1 + (i - 1) * M;
        upper = M + (i - 1) * M;
        
        if upper > N
            dec(i) = randvalue(x(lower:end));
        else
            dec(i) = randvalue(x(lower:upper));
        end
    end

    o = dec';
end

function [ v ] = randvalue( x ) 
    v = x(randi(numel(x)));
end

