clear;
V=load('vir-1.pos');
M=[-432 -432 -108];
N=repmat(M,size(V,1),1);
V1=V+N;
V2=V1/2;
dlmwrite('vir-1-bin4.pos',V2,' ');