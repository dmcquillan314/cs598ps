function l5_25()

    MeanVec = [0 0];
%     CovMatrix = [2.5 1.3; 1.4 0.75];
    CovMatrix = [45.8 -0.59; -0.59 1.88 ];

    D = probDist(MeanVec, CovMatrix, 1000);
    [ P, eig_val, eig_vec ] = computepca(D);
    
    
    [ cov_eig_val, cov_eig_vec ] = eig(CovMatrix);
    
    figure;
    subplot(1,2,1);
    
    hold on;
    plot(D(:,1),D(:,2), '.','MarkerSize',2);
    plotv(cov_eig_vec(:,1));
    plotv(cov_eig_vec(:,2));
    axis([ -8 8 -4 4 ])
    grid on; 
    title('Input Data');
    hold off;
    
    subplot(1,2,2);
    plot(P(:,1),P(:,2), '.','MarkerSize',2);
    title('Transformed Data (feature weights)');

end

