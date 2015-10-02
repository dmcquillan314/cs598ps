function l6_51()

    [ data, v ] = video_data('hands.mp4');
    
    [ E, D ] = eigs(data * data', 3);
    
    figure;
    
    subplot(2,3,1);
    imshow(reshape(E(:,1), v.Height, v.Width), []);
    %plot(E(:,1));
    
    subplot(2,3,2);
    imshow(reshape(E(:,2), v.Height, v.Width), []);
    %plot(E(:,2));
    
    subplot(2,3,3);
    imshow(reshape(E(:,3), v.Height, v.Width), []);
    %plot(E(:,3));
    
    pca_data = (E' * data)';
    subplot(2,3,4);
    plot(pca_data(:,1));
    axis([ 0 125 -7000 7000 ]);

    subplot(2,3,5);
    plot(pca_data(:,2));
    axis([ 0 125 -7000 7000 ]);

    subplot(2,3,6);
    plot(pca_data(:,3));
    axis([ 0 125 -7000 7000 ]);
end


