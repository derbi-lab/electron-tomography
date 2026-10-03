% this script will generate points that are 'd' distance apart over a
% virion of radius 'R'
%------------------------------------------------------------------------------------------------------------
%uncomment this when generate the unbinned points
%X=[450 350 64]
%comment the following tow lines when generate unbinned points
center=[15 -95 0]
X=center;
%X=X+center
%X=X.*2
%R=400;
%d=10;
%-------------------------------------------------------------------------------------------------------------
d=5;
R=220;
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
F=X
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
    F=X;
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
    F=X;
    G=repmat(F,n,1);
    I=I+G;
    E=vertcat(E,I);
    
    %dlmwrite('circle[i].new',E,' ');
end
size(E)
dlmwrite('tomo-6891-points.txt',E,' ');