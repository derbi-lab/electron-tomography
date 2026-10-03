%this code changes alla binned points to original ones
%V1=dlmread('points_med_vir20.txt');
%V1=dlmread('clicked-four-points-SIV-original.txt');
V1=dlmread('microvilli_spike_coordinate.pos');
m=size(V1,1);
 X1=2*V1;
 %Y=[-840 -840 -240];
 Y=[-300 -700 -216];
 Z1=repmat(Y,m,1);
 V1=X1+Z1;
%dlmwrite('points_original_vir20.txt',V1,' ');
%dlmwrite('clicked-four-points-SIV-original_unbinned.txt',V1,' ');
dlmwrite('microvilli_spike_coordinate_original.pos',V1,' ');