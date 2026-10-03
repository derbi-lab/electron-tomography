clear;
V=load('tomo-7061-bigger.pos')
nx=size(V,1);
X=[-864 -800 -128];
Y=repmat(X,nx,1)
V1=V+Y
V=V1./2
dlmwrite('tomo-7061-bigger-bin2.pos',V,' ');