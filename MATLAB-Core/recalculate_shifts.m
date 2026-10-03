% this code adds shifts of each points after alignment with the origianl
% points positions 
clear V1;
clear V2;
clear V3;
V1=dlmread('points_for_vir1_align01.txt');
V2=dlmread('shifts_for_vir1_align01.txt');
V3=V1+V2;
%dlmwrite('points+shifts_vir1.txt',V3,' ');
X = dlmread('points+shifts_vir1.txt');
R=[];
n=size(V3,1);
d=size(V3,2);
Y=[91.434575 129.234575 0];
Z=repmat(Y,n,1);
V=X-Z;
for i=1:n
        dist=sqrt(sum(V(i,:).^2,2));
        R=[R; dist];
end
r=138.4346;
%new co-ordinate are stored in V1_new
ratio=r./R;
for i=1:n
    V1_new(i,:)=V1(i,:)./ratio(i,:);
end
V4=V1_new-X;
dlmwrite('shift_matrix_vir1.txt',V4,' ');


