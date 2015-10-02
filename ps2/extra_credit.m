function [] = extra_credit()
    
    load('one.mat');
    [~,n] = size(one);
    img_size = 28;
    img_size_sq = img_size^2;
    
    data = zeros(img_size_sq,n);
    for i=1:n
        c = one(1,i);
        data(:,i) = vec(c{:});
    end
    
    trans_data = data';
    

    figure;
    [Y] = laplacian_eigenmap(trans_data,1,10);
    plot(Y(:,1),Y(:,2),'.');
    
    h = msgbox(strcat('According to the figure it can be seen that the ',...
    'points are confined into a cluster like shape.  With the addition ',...
    'of more numbers and images to classify this could be useful to create ',...
    'a number/letter recognition system.'));
    h.Name = 'Extra Credit';
    h.Resize = 'on';
    ah = get( h, 'CurrentAxes' );
    ch = get( ah, 'Children' );
    set( ch, 'FontSize', 20 );
end

