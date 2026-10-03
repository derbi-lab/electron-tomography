function reacalculate_shifts_straching_new(str_fraction)
% this code adds shifts of each points after alignment with the origianl
% points positions 
clear V1;
clear V2;
clear V3;
% the point file
P=dlmread('set1_vir01.txt');
% the initial point+shift file
X = dlmread('shifted_pts_raw_vir01.txt');
size(X)
r=[];
R=[];
n=size(X,1);
d=size(X,2);
row=1;
%--------------------------------------------------------------------------
%calculating the initial radius];
%Y=[765.763369 385.663369 -16.000000];
C=[91.434575 129.234575 0.000000
 419.099096 362.399096 -14.000000
 -48.745156 -216.745156 0.000000
 -148.475950 355.524050 -8.000000
 -195.725217 52.074783 0.000000
 178.657379 457.957379 -10.000000
 527.683047 605.383047 -10.000000
 607.425000 174.825000 8.000000
 765.763369 385.663369 -16.000000 
 -628.937501 370.662499 2.000000 
 -382.711953 301.888047 6.000000
 -345.931269 -173.731269 10.000000
 -441.457491 68.842509 6.000000
 -352.015672 -171.415672 -36.000000
 321.906450 -5.693550 -44.000000
 437.875985 -232.024015 -40.000000
 197.952778 -184.247222 42.000000
 298.752084 -404.747916 34.000000
 251.681365 -582.018635 0.000000
 -400.026936 -576.426936 -48.000000];
Y=[C(row,1) C(row,2) C(row,3)]
Z=repmat(Y,n,1);
size(Z)
V=X-Z;
for i=1:n
        dist=sqrt(sum(V(i,:).^2,2));
        r=[r; dist];
end
%--------------------------------------------------------------------------
% calculating the changed radius after alignment
X1 = dlmread('shifted_pts_ali_vir01.txt');
size(X1)
V1=X1-Z;
for i=1:n
        dist=sqrt(sum(V1(i,:).^2,2));
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
ratio=R_new./R;
for i=1:n    
    V2(i,:)=X1(i,:).*ratio(i,:);
end
V3=V2-P;
dlmwrite('shifts_vir01_cycle00.txt',V3,'delimiter',' ','precision',16);
end
