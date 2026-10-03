% this script will generate points that are 'd' distance apart over a
% virion of radius 'R'
%-------------------------------------------------------------------------------------------------------------
R=100;
xc=0;
yc=0;
zc=0;
c=[xc yc zc];
%c=[0 0 0];
%--------------------------------------------------------------------------------------------------------------
%d=9.0826;
d=50;
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
F=[0 0 0];
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
    F=[0 0 0];
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
    F=[0 0 0];
    G=repmat(F,n,1);
    I=I+G;
    E=vertcat(E,I);
    
    %dlmwrite('circle[i].new',E,' ');
end
dlmwrite('hanna-points-5.txt',E,' ');