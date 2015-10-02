function l6_54()

    figure;
    [ data, v ] = video_data('hands.mp4');

    [ h, w ] = nmf(data, 2, 500);
    
    subplot(2,2,1);
    imshow(reshape(h(:,1), v.Height, v.Width), []);
    
    subplot(2,2,2);
    imshow(reshape(h(:,2), v.Height, v.Width), []);

    subplot(2,2,3);
    plot(w(1,:));

    subplot(2,2,4);
    plot(w(2,:));

end

