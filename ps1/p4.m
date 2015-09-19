function p4( )
    p4_1();
    p4_2();
end

function p4_2()

    kanji = double(imread('52.png'));

    base_gaus = p4gaussian();
    
    ninety_deg_fil = base_gaus;
    zero_deg_fil = rot90(base_gaus);
    neg_45_deg_fil = imrotate(base_gaus, -45);
    pos_45_deg_fil = imrotate(base_gaus, 45);
        
    figure;
    subplot(2,2,1);
    convolution = conv2(kanji,ninety_deg_fil);
    imshow(convolution);
    
    subplot(2,2,2);
    convolution = conv2(kanji,zero_deg_fil);
    imshow(convolution);
    
    subplot(2,2,3);
    convolution = conv2(kanji,neg_45_deg_fil);
    imshow(convolution);
    
    subplot(2,2,4);
    convolution = conv2(kanji,pos_45_deg_fil);
    imshow(convolution);
    
end

function p4_1()
    edge_filter = [ -0.125 -0.125 -0.125; -0.125 1 -0.125; -0.125 -0.125 -0.125 ];

    white_inner_box = p4rectangle(255, 0);
    uint8_white_inner_box = uint8(white_inner_box);
    filtered_white_inner_box = conv2(double(white_inner_box), edge_filter);
    
    grey_inner_box = p4rectangle(200, 255);
    uint8_grey_inner_box = uint8(grey_inner_box);
    filtered_grey_inner_box = conv2(double(grey_inner_box), edge_filter);

    figure;
    
    subplot(2,2,1);
    title('Input');
    imshow(uint8_grey_inner_box);
    
    subplot(2,2,2);
    title('Energy of edge detector');
    imshow(filtered_grey_inner_box);
    
    subplot(2,2,3);
    title('Input');
    imshow(uint8_white_inner_box);

    subplot(2,2,4);
    title('Energy of edge detector');
    imshow(filtered_white_inner_box);

end