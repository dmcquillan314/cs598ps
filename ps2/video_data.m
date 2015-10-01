function [ data, v ] = video_data( video_file )
    v = VideoReader(video_file);
        
    frames = ceil(v.FrameRate * v.Duration);
    
    data = zeros(v.Height * v.Width, frames);
    
    frame = 1;
    while hasFrame(v)
        data(:, frame)  = vec(rgb2gray(readFrame(v)));
        frame = frame + 1;
    end


end

