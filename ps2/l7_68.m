function [ output_args ] = l7_68( input_args )

    v = VideoReader('hotlips.mp4');
        
    frames = ceil(v.FrameRate * v.Duration);
    
    data = zeros(v.Height * v.Width, frames);
    
    frame = 1;
    while hasFrame(v)
        data(:, frame)  = vec(rgb2gray(readFrame(v)));
        frame = frame + 1;
    end
    
    [Y, v] = laplacian_eigenmap(data', 6, 2);
    plot(v(:,1), v(:,2), '.');
end

