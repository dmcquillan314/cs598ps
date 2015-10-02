function l7_68_70()

    figure;
    [data, v ] = video_data('hotlips.mp4');
        
    [Y] = lle(data, 2, 2);
    plot(Y(1,:), Y(2,:));
end

