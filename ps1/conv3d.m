function [ filter_g ] = conv3d( im_filter, im_double )
    r = conv2(im_filter(:,:,1), im_double(:,:,1));
    g = conv2(im_filter(:,:,2), im_double(:,:,2));
    b = conv2(im_filter(:,:,3), im_double(:,:,3));
    
    [xn, yn ] = size(r);
    filter_g = zeros(xn, yn, 3);
    filter_g(:,:,1) = r;
    filter_g(:,:,2) = g;
    filter_g(:,:,3) = b;
end

