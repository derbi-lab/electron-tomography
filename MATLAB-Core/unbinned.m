%this code changes all binned points to original ones
V1=load('tomo-7401-bigger.pos');
m=size(V1,1);
 Y=[432 400 64];
 Z1=repmat(Y,m,1);
 V1=V1+Z1;
 V1=V1.*2;
dlmwrite('tomo-7401.pos',V1,' ');