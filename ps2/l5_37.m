function [ faces ] = l5_37( )
%L5_37 Summary of this function goes here
%   Detailed explanation goes here
    faces = l5_faces();
    
    N = size(faces.X,2);
    M = 36;
    faces.X = faces.X(:,1:N) ./ 255;
    
    avg_face = mean(faces.X,2);
    
    cent_face_data = faces.X - repmat(avg_face, [1,N]);
    trans_cent_face_data = cent_face_data';
    
    [eig_vec, eig_val] = eigs(cov(trans_cent_face_data), M);
    
    figure;
    for i = 1:M
        subplot(6,6,i);
        imshow(reshape(eig_vec(:,i),faces.M,faces.N), []);
    end
    figure;
    for i = 1:M
        subplot(6,6,i);
        imshow(reshape(faces.X(:,i),faces.M,faces.N), []);
    end
    
end

