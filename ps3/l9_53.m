function l9_53()

figure;
faces = load('face2.mat');

% avg_face = average_face(faces);
% 
% N = size(faces.XX,2);
% 
% data = faces.XX - repmat(avg_face, [1,N]);

p = computepca(faces.XX,2);

pn = normalize(p);

scatter(pn(:,1),pn(:,2), [], faces.g);
colormap winter;

% assure features are in columns
[ w ] = percep(pn', faces.g);

hold on;

plot(w);

hold off;

end
