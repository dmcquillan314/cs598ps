function [ RD ] = rotate_data( data, theta )

    R = [ cos(theta) -sin(theta); sin(theta) cos(theta) ];
    
    RD = data * R;

end

