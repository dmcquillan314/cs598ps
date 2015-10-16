function l10_39( )
    
    figure;
    MU1 = [2 2];
    SIGMA1 = [0.75 0; 0 0.7];
    MU2 = [-3 -2.5];
    SIGMA2 = [0.75 0; 0 0.7];

    D1 = probDist(MU1, SIGMA1, 40);
    y1 = ones(40, 1);
    D2 = probDist(MU2, SIGMA2, 40);
    y2 = -1 * ones(40, 1);
    
    X = [D1; D2];
    y = [y1; y2];
    
    [w, w_0] = quadprog_svm(X, y);
    
    Xax = -20:20; 
    Yax=-(w_0+Xax*w(1))/w(2);
    
    subplot(1,2,1);
    hold on;
    scatter(D1(:,1),D1(:,2))
    scatter(D2(:,1),D2(:,2))
    plot(Xax,Yax);
    hold off;
    
    axis([ -4 4 -4 4 ]);
      
    res = w * X';
    
    subplot(1,2,2);
    stem(res);

end

