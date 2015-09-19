function [ C ] = fadingCircle( diameter )
    N = floor(diameter / 2); %// this decides the size of image
    [X,Y] = meshgrid(-1:1/N:1, -1:1/N:1);
    nrm = sqrt(X.^2 + Y.^2);
    out = (1*(nrm/min(nrm(:,1))));
    C = out;
%     temp = ones(diameter, diameter, 3);
%     
%     for i = 1:diameter
%         for j = 1:diameter
%             temp(i,j,:) = out(i,j);
%         end
%     end
%     
%     C = uint8(temp);
end

