function [ output_args ] = l7_68_70( input_args )


    [data, v ] = video_data('hotlips.mp4');
        
    [Y] = lle(data, 2, 2);
    plot(Y(1,:), Y(2,:));
end

