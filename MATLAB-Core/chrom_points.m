clear;
% this script will generate points that are 'd' distance apart over a
% virion of radius 'R'
%-----------------------------------------------------------------------------------------------------------
V=load('tomo-6891.pos');
nx=size(V,1);
base_name='tomo-6891-';
suffix='.pos';
R=15;
d=5;
%..................................................
%calculate radius of each HIV virions for Zongjun
center=[];
%.................................................. 
for i=1:nx
j=num2str(i)   
 xc=V(i,1);
 yc=V(i,2);
 zc=V(i,3);
c=[xc yc zc]
center=[center;[c R]]
dlmwrite('CENTER_AND_RADIUS_ALL_CHROM_6891.dat',center,' ');
%--------------------------------------------------------------------------------------------------------------
%no of cicles in one hemisphere
S=(pi*R)/2
%N=round(S/d)
N=ceil(S/d)
% points in the 0th circle
n=round(2*pi*R/d)
Z=0;
t=[0:n-1]';
       A=R*cos(2*pi*t/n);
       B=R*sin(2*pi*t/n);
       plot(R*cos(2*pi*t/n),R*sin(2*t*pi/n),'o')
C=horzcat(A,B);       
D=repmat(Z,n,1);
E=horzcat(C,D);
size(E)
%F=[0 0 0];
F=[xc yc zc];
%F=[V(i,1) V(i,2) V(i,3)];
G=repmat(F,n,1);
size(G)
E=E+G;
size(E)
%dlmwrite('circle_0.new',E,' ');
% points on other circles
for i=1:N
    theta=(i*d/R);
    R_new=R*(cos(theta));
    Z=R*(sin(theta));
    n=round((2*pi*R_new/d));
    t=[0:n-1]';
       A=R_new*cos(2*pi*t/n);
       B=R_new*sin(2*pi*t/n);
       plot(R_new*cos(2*pi*t/n),R_new*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n,1);
    H=horzcat(C,D);
    %F=[0 0 0];
    F=[xc yc zc];
    %F=[V(i,1) V(i,2) V(i,3)];
    G=repmat(F,n,1);
    H=H+G;
    E=vertcat(E,H);
    
    %dlmwrite('circle[i].new',E,' ');
end
for i=1:N
    theta=(i*d/R);
    R_new=R*(cos(theta));
    Z=-R*(sin(theta));
    n=round((2*pi*R_new/d));
    t=[0:n-1]';
       A=R_new*cos(2*pi*t/n);
       B=R_new*sin(2*pi*t/n);
       plot(R_new*cos(2*pi*t/n),R_new*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n,1);
    I=horzcat(C,D);
    %F=[0 0 0];
    F=[xc yc zc];
    %F=[V(i,1) V(i,2) V(i,3)];
    G=repmat(F,n,1);
    I=I+G;
    E=vertcat(E,I);
    
    %dlmwrite('circle[i].new',E,' ');
end
file_name=strcat(base_name,j,suffix);
%file_name='chromatin_pts50.pos'
dlmwrite(file_name,E,' ');
end
