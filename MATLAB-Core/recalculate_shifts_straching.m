function reacalculate_shifts_straching(str_fraction)
% this code adds shifts of each points after alignment with the origianl
% points positions 
clear V1;
clear V2;
clear V3;
V1=dlmread('sph000_vir19_points.txt')
V2=dlmread('sph000_vir19_shifts.txt')
V3=V1+V2
dlmwrite('points+shifts_vir19_initial.txt',V3,' ');
X = dlmread('points+shifts_vir19_initial.txt');
r=[];
R=[];
n=size(V3,1);
d=size(V3,2);
%--------------------------------------------------------------------------
%calculating the actual radius];
Y=[-0.244609 -1.244609 0.000000];
Z=repmat(Y,n,1);
V=X-Z
for i=1:n
        dist=sqrt(sum(V(i,:).^2,2));
        r=[r; dist];
end
r
%--------------------------------------------------------------------------
% calculating the changed radius
V11=dlmread('sph000_vir19_points.txt');
V22=dlmread('sph000_vir19_shifts_ali.txt');
V33=V11+V22;
dlmwrite('points+shifts_vir19_ali.txt',V33,' ');
X1 = dlmread('points+shifts_vir19_ali.txt');
U=X1-Z;
for i=1:n
        dist=sqrt(sum(U(i,:).^2,2));
        R=[R; dist];
end
%--------------------------------------------------------------------------------------
% to allow stratching
for i=1:n
    if (R(i,1)>=r(i,1))
        R_new(i,1)=R(i,1)+R(i,1)*str_fraction;
    else
        R_new(i,1)=R(i,1)-R(i,1)*str_fraction;
    end
end
R_new
ratio=R_new./R
for i=1:n    
    V3_new(i,:)=X1(i,:).*ratio(i,:);
end
V3_new;
V4=V3_new-V1;
dlmwrite('shift_matrix_vir19_align00_new.txt',V4,' ');
end
