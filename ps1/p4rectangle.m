function [ box ] = p4rectangle( inner_color, outer_color )

    inner_box = uint8(ones(50,50,3) * inner_color);
    outer_box = uint8(ones(50,50,3) * outer_color);
    
%     inner_box(1:8, 1:2,:) = outer_color;
%     inner_box(1:6, 3,:) = outer_color;
%     inner_box(1:5, 4,:) = outer_color;
%     inner_box(1:4, 5:6,:) = outer_color;
%     inner_box(1:2, 7:8,:) = outer_color;
% 
%     inner_box(1:8, 99:100,:) = outer_color;
%     inner_box(1:6, 98,:) = outer_color;
%     inner_box(1:5, 97,:) = outer_color;
%     inner_box(1:4, 95:96,:) = outer_color;
%     inner_box(1:2, 93:94,:) = outer_color;
% 
%     inner_box(99:100, 93:100,:) = outer_color;
%     inner_box(98, 95:100,:) = outer_color;
%     inner_box(97, 96:100, :) = outer_color;
%     inner_box(95:96,97:100, :) = outer_color;
%     inner_box(93:94,99:100, :) = outer_color;
% 
%     inner_box(99:100,1:8, :) = outer_color;
%     inner_box(98,1:6, :) = outer_color;
%     inner_box(97,1:5, :) = outer_color;
%     inner_box(95:96,1:4, :) = outer_color;
%     inner_box(93:94,1:2, :) = outer_color;

    box = rgb2gray([ outer_box outer_box outer_box; outer_box inner_box outer_box; outer_box outer_box outer_box ]);
end

