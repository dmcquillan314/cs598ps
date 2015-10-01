function [D1] = compute_dist_floyd(D,point_list)
    N = length(point_list);

    for k=1:N
         D = min(D,repmat(D(:,k),[1 N])+repmat(D(k,:),[N 1])); 
    end

    D1 = D;
end