% this script will generate points that are 'd' distance apart over a
% virion of radius 'R'
%-------------------------------------------------------------------------------------------------------------
x1=88.2;
y1=264.6;
z1=0;
x2=98.7;
y2=-4.2;
z2=z1;
x3=-42.0;
y3=117.6;
z3=z1;
x4=222.0;
y4=126.0;
z4=z1;
d1=sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
d2=sqrt((x3-x4)*(x3-x4) + (y3-y4)*(y3-y4));
%d1=y3-y4
%d2=x2-x1
r=((d1+d2)/2)/2
R=r+10;
%calculating the center ofthe virion
x=[x1 x2 x3 x4];
xc=min(x)+r;
y=[y1 y2 y3 y4];
yc=min(y)+r;
zc=z1;
c=[xc yc zc]
%c=[0 0 0];
%--------------------------------------------------------------------------------------------------------------
%d=9.0826;
d=18.1652;
%R=59.325;
%no of cicles in one hemisphere
S=(pi*R)/2
N=round(S/d)
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
%F=[0 0 0];
F=[xc yc zc];
G=repmat(F,n,1);
E=E+G;
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
    G=repmat(F,n,1);
    I=I+G;
    E=vertcat(E,I);
    
    %dlmwrite('circle[i].new',E,' ');
end
size(E)
dlmwrite('test_points_vir01_new.txt',E,' ');