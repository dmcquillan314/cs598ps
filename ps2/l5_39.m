function l5_39()

    faces = l5_faces;

    act_face = faces.X(:,11);
    
    rec_face_10 = reconstruct(faces, 10, 11);
    
    rec_face_50 = reconstruct(faces, 50, 11);
    
    figure;
    subplot(1,3,1);
    imshow(reshape(rec_face_10, faces.M, faces.N), []);
    title('10 Component Estimation');
    
    subplot(1,3,2);
    imshow(reshape(rec_face_50, faces.M, faces.N), []);
    title('50 Component Estimation');
    
    subplot(1,3,3);
    imshow(reshape(act_face, faces.M, faces.N), []);
    title('Original');

end

function [F] = reconstruct(faces, v, f)
    N = size(faces.X, 2);

    X = faces.X';
    avg_face = mean(X);
    zm_faces = X - repmat(avg_face, [N 1]);
    
    [F, V, W] = svd(zm_faces');
    
    P = V(1:v,:) * W';
    recon = (F(:, 1:v) * P(:, f))' + avg_face;
    
    F = recon;
end
