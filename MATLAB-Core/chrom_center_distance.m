% this code deletes the points that are within a circle of radius 10 from a point. So this points gives the reduced data sets
V=load('center-after-GUI.txt');
nx=size(V,1)
Y=[1024 1024];
DIST=[];
for i=1:nx
    dist = sqrt((V(i,1)-1024).^2+(V(i,2)-1024).^2);
    DIST = [DIST;dist];
end
DIST
dlmwrite('distance-after-GUI.txt',DIST);