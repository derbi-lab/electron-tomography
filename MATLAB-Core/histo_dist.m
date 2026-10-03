% this code deletes the points that are within a circle of radius 10 from a point. So this points gives the reduced data sets
V=dlmread('vir-1-pts.pos');
X=load('center_and_radius_allvirus_new.txt');
nx=size(V,1)
i=1;
X(i,4)+11
Y=[X(i,1) X(i,2) X(i,3)];
M=repmat(Y,nx,1);
size(M)
DIST=[];
counter = 0;
dataMatrix=V;
queryMatrix=M;
x=size(queryMatrix,1);
%=size(dataMatrix,1);
numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
CNT=[];
  for i=1:numQueryVectors;
      cnt=0;
    counter = 0;
    dist = sqrt(sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2));
  end
 dist;
 for i=1:nx
 DIST=[DIST;[V(i,1) V(i,2) V(i,3) dist(i)]];
 end
 sorted_DIST=sortrows(DIST,4);
 sorted_DIST=flipud(sorted_DIST);
 D_throw=sorted_DIST(1:round((nx*5)/100),:)
 %sort(dist,'descend');
 size(DIST)
    size(dist)
    hist(dist,50)
D_throw_points=D_throw(:,1:3);
dlmwrite('final-thrown-up-points-vir1.pos',D_throw_points,' ');