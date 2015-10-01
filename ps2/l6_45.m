function l6_45()
    figure;
    X = gen_input();
    r = 2;
    [w, h] = nmf(X,r, 500);
    
    subplot(2,3,1);
    imagesc(X);
    title('Original')
    set(gca, 'YDir', 'normal');
    colorbar;
    
    subplot(2,3,2);
    plot(w(:,1));
    title('w - 1st column');
    axis([ 0 100 -10 10 ]);
    
    subplot(2,3,3);
    plot(w(:,2));
    title('w - 2nd column');
    axis([ 0 100 -10 10 ]);
        
    subplot(2,3,4);
    imagesc(w * h);
    title('Estimation')
    set(gca, 'YDir', 'normal');
    colorbar;

    subplot(2,3,5);
    plot(h(1,:));
    title('h - 1st row');
    axis([ 0 200 -1 1 ]);
    
    subplot(2,3,6);
    plot(h(2,:));
    title('h - 2nd row');
    axis([ 0 200 -1 1 ]);


end

function [ X ] = gen_input()
    I = zeros(100,200);
    I(5:25,1:25) = 1;
    I(5:25,50:90) = 1;
    I(5:25,130:160) = 1;
    I(5:25,185:200) = 1;
    
    I(80:90,20:40) = 1;
    I(80:90,80:120) = 1;
    I(80:90,150:180) = 1;
    
    imagesc(I);
    set(gca, 'YDir', 'normal');
    colorbar;
    
    X = I;
end
