V=load('all-points.txt');
U=[512 512 111];
W=repmat(U,size(V,1),1);
V=V+W;
dlmwrite('all-points-changed-center.txt',V,' ');