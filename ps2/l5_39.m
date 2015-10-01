function [ output_args ] = l5_39( input_args )
%L5_39 Summary of this function goes here
%   Detailed explanation goes here
    faces = l5_faces();
    
    N = size(faces.X,2);
    M = 10;
    faces.X = faces.X(:,1:N) ./ 255;
    
    avg_face = mean(faces.X,2);
    
    cent_face_data = faces.X - repmat(avg_face, [1,N]);
    trans_cent_face_data = cent_face_data';
    
    [eig_vec, eig_val] = eig(cov(trans_cent_face_data));
    
    reconstruct = faces.X(:,11);

    figure;
    imshow(reshape(reconstruct, faces.M, faces.N));

    eig_vec' * cent_face_data;
end

