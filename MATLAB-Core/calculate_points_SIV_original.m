% this script will generate points that are 'd' distance apart over a
% virion of radius 'R'
%-------------------------------------------------------------------------------------------------------------
X=load('CLICKED_4_POINTS_BIN2_NEW.pos');
X=X*2;
%change i
i=0;
x1=X(4*i+1,1)
y1=X(4*i+1,2)
z1=X(4*i+1,3)
x2=X(4*i+2,1)
y2=X(4*i+2,2)
z2=X(4*i+2,3)
x3=X(4*i+3,1)
y3=X(4*i+3,2)
z3=X(4*i+3,3)
x4=X(4*i+4,1)
y4=X(4*i+4,2)
z4=X(4*i+4,3)
d1=sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
d2=sqrt((x3-x4)*(x3-x4) + (y3-y4)*(y3-y4));
%d1=y3-y4
%d2=x2-x1
r=((d1+d2)/2)/2
R=r+11
x=[x1 x2 x3 x4];
xc=min(x)+r;
y=[y1 y2 y3 y4];
yc=min(y)+r;
zc=z1;
center=[];
c=[xc yc zc]
center=[center;[c R]]
dlmwrite('NEW_CENTER_AND_RADIUS_ALL_VIR.dat',center,' ');
%c=[0 0 0];
%--------------------------------------------------------------------------------------------------------------
%d=9.0826;
d=8;
%d=18.1652;
%d=18;
%d=15;
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
dlmwrite('NEW_points_vir00-r+11-gap-6.txt',E,' ');