A =[90 130 0]
B = dlmread('shifted_points-01.txt')
dist = sum((repmat(A,size(B,1),1)-B).^2,2);
dist = sqrt(dist)