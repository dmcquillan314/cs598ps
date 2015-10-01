function l7_56()
    N = 2000;
    [X] = swiss_roll(N);
    cmap = jet(N);
    
    Y = laplacian_eigenmap(X, 60, 10);

    figure;
    
    subplot(1,2,1);
    scatter3(X(:,1),X(:,2),X(:,3),20,cmap);
    title('Original');

    subplot(1,2,2);
    scatter(Y(:,1), Y(:,2), 20, cmap);
    title('LE');
end


