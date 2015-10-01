function [ A ] = l5_average_face( faces )

    N = faces.M * faces.N;
    
    A = zeros(N,1);
    for j = 1:N
        A(j) = mean(faces.X(j,:));
    end

end

