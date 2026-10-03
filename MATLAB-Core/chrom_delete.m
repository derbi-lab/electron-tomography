% this code deletes the points that are within a circle of radius 10 from a point. So this points gives the reduced data sets
V=dlmread('ch1_pts.pos');
M=dlmread('ch1_pts.pos');
counter = 0;
dataMatrix=V;
queryMatrix=M;
x=size(queryMatrix,1);
%=size(dataMatrix,1);
numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
D=[];
  for i=1:numQueryVectors;
    dist = sqrt(sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2));
    D=[D;dist];
  end
  size(D)
  D_sort=sort(D,'descend')
