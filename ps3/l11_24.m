function [ output_args ] = l11_24( input_args )
plot_knn(100,100,3, 'easy classification problem');
plot_knn(100,100,2, 'harder classification problem');
plot_knn(100,100,1, 'really hard classification problem');
end

function plot_knn(N1,N2,offset, label)
x = [randn(N1,2);randn(N2,2)+offset];
t = [zeros(N1,1);ones(N2,1)];
N = size(x,1);

tv = unique(t);
f = figure;
f.Name = label;

Kvals = [1 3 5 11 21 100];
plot_num = 1;
for kv = 1:length(Kvals)

    subplot(3,2,plot_num);
    hold on;
    for i = 1:length(tv)
        pos = find(t==tv(i));
        plot(x(pos,1),x(pos,2),'.');
    end

    [Xv, Yv] = meshgrid(min(x(:,1)):0.1:max(x(:,1)),min(x(:,2)):0.1:max(x(:,2)));
    classes = zeros(size(Xv));
    K = Kvals(kv);
    for i = 1:length(Xv(:))
        this = [Xv(i) Yv(i)];
        dists = sum((x - repmat(this,N,1)).^2,2);
        [~, I] = sort(dists,'ascend');
        [a,b] = hist(t(I(1:K)));
        pos = find(a==max(a));
        if length(pos)>1
            order = randperm(length(pos));
            pos = pos(order(1));
        end
        classes(i) = b(pos);
    end
    f.Name = label;
    for i = 1:length(tv)
        pos = find(t==tv(i));
        plot(x(pos,1),x(pos,2),'.');
    end
    contour(Xv,Yv,classes,[0.5 0.5],'k')
    ti = sprintf('%g-nearest neighbors',K);
    title(ti);
    hold off;
    
    plot_num = plot_num + 1;
end
end

