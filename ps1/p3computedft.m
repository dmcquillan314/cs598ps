function [ T ] = p3computedft( M )

    F = fft(eye(size(M,1)));
    T = F * M * F;
    
end

