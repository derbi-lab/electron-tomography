%this code changes alla binned points to original ones
V1=load('h-new-bin4-points.pos');
m=size(V1,1);
 X1=2*V1;
dlmwrite('h-new-bin2-points.pos',X1,' ');