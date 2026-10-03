V=load('points-37-hESg2t7.txt');
X=[26 33 82];
V=V/2;
Y=repmat(X,size(V,1),1);
Z=V+Y;
M=[-256 -256 -128];
N=repmat(M,size(V,1),1);
Z=Z+N;
dlmwrite('points-37-bin4-hESg2t7.txt',Z,' ');