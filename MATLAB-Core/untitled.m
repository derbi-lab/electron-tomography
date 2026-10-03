%this code changes alla binned points to original ones
%V1=dlmread('points_med_vir20.txt');
%V1=dlmread('clicked-four-points-SIV-original.txt');
V1=load('tomo-6821-extra.pos');
m=size(V1,1);
 
 %Y=[-840 -840 -240];
 Y=[450 350 64];
 Z1=repmat(Y,m,1);
 V1=V1+Z1;
 V1=V1.*2;
%dlmwrite('points_original_vir20.txt',V1,' ');
%dlmwrite('clicked-four-points-SIV-original_unbinned.txt',V1,' ');
dlmwrite('tomo-6821.pos',V1,' ');