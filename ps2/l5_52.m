function l5_52()
%L5_52 Summary of this function goes here
%   Detailed explanation goes here
    faces = l5_faces;
    
    nsamples = size(faces.X,2);
    
    patch_size = 10;
    n_eig_patches = 50;
    
    patch_size_sq = patch_size^2;
    
    patches = zeros(patch_size_sq, nsamples);
    
    for i=1:nsamples
        img = faces.X(:,i);
        patches(:,i) = random_patch(patch_size, img, faces);
    end
    f = figure;
    f.Name = 'Patch Matrix';
    imagesc(patches);
    title('10x10 patches')
        
    f = figure;
    f.Name = 'Patches';
    for i = 1:n_eig_patches
        subplot(5,10,i);
        imshow(reshape(patches(:,i),patch_size,patch_size), []);
    end

    [eig_vec, ~] = eig_decomp(patches, n_eig_patches);
    
    f = figure;
    f.Name = 'Eigen Patches';
    for i = 1:n_eig_patches
        subplot(5,10,i);
        imshow(reshape(eig_vec(:,i),patch_size,patch_size), []);
    end
    
    dft_eig_patches = abs(computedft(eig_vec));
    f = figure;
    f.Name = 'Fourier Patches';
    for i = 1:n_eig_patches
        subplot(5,10,i);
        imshow(reshape(dft_eig_patches(:,i),patch_size,patch_size), []);
    end

end

function [eig_vec,eig_val] = eig_decomp(patches, nsamples)
    X = patches;
    N = size(patches,2);
    avg_patch = mean(X,2);
    zm_patches = X - repmat(avg_patch, [1,N]);
    
    [eig_vec, eig_val] = eigs(cov(zm_patches'), nsamples);

end

function [ p ] = random_patch(patch_size, img, faces)
    m_start = random_value(1, faces.M - patch_size);
    m_end = m_start + patch_size - 1;
    n_start = random_value(1, faces.N - patch_size);
    n_end = n_start + patch_size - 1;
    
    reshaped_image = reshape(img, faces.M, faces.N);
    
    patch = reshaped_image(m_start:m_end,n_start:n_end);
    
    p = vec(patch);

end

function [ n ] = random_value(a, b)
    b = b + 1;
    n = floor((b - a) .* rand(1,1)) + a;
end