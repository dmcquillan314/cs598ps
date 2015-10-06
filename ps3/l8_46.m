function l8_46(  )

map = [0, 0, 0.3
    0, 0, 0.4
    0, 0, 0.5
    0, 0, 0.6
    0, 0, 0.8
    0, 0, 1.0];

    figure;
    data = load('one.mat');
    edge_detect = [ -0.125 -0.125 -0.125; -0.125 1 -0.125; -0.125 -0.125 -0.125 ];
    
    subplot(1,3,1);
    imagesc(data.one);
    title('Input');
    colormap(map);
    
    template = conv2(data.one, edge_detect);
    
    subplot(1,3,2);
    imagesc(template);
    title('Input gradient');
    colormap(map);
    
    filter_output = conv2(data.one, template);
    
    subplot(1,3,3);
    imagesc(filter_output);
    title('Matched filter output');
    colormap(map);

end

