function l7_36()

    figure;
    cities = load('cities.mat');
    D = cities.D;
    N = 18;
    O_V = ones(N, 1);
    O_H = O_V';
    
    S = (-0.5) * (D - (1/N) * D * O_V * O_H - (1/N) * O_V * O_H * D + (1/N^2) * O_V * O_H * D * O_V * O_H);
    
    [E,L] = eig(S);
    X = (sqrt(L) * E');
    plot3(X(1,:), X(2,:), X(3,:), '.');
    text(X(1,:), X(2,:), X(3,:), cities.cities);
    
    % S = (Eigen_vector) . (eigen_values) . (Eigen_vector')
    % X = (sqrt(Eigen_values) * (Eigen_vector')

end

