R=110;
%--------------------------------------------------------------------------------------------------------------
%d=9.0826;
d=20;
%R=59.325;
%no of cicles in one hemisphere
S=(pi*R)/2
%N=round(S/d)
N=ceil(S/d)
% points in the 0th circle
n=round(2*pi*R/d)
Z=0;
t=[0:n]';
       A=R*cos(2*pi*t/n);
       B=R*sin(2*pi*t/n);
       plot(R*cos(2*pi*t/n),R*sin(2*t*pi/n),'o')
C=horzcat(A,B);       
D=repmat(Z,n+1,1);
E=horzcat(C,D);
F=[0 0 0];
G=repmat(F,n+1,1);
E=E+G;
%%%%%%%%
for i=1:N
    theta=(i*d/R);
    R_new=R*(cos(theta));
    Z=R*(sin(theta));
    n=round((2*pi*R_new/d));
    t=[0:n]';
       A=R_new*cos(2*pi*t/n);
       B=R_new*sin(2*pi*t/n);
       plot(R_new*cos(2*pi*t/n),R_new*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n+1,1);
    H=horzcat(C,D);
    F=[0 0 0];
    G=repmat(F,n+1,1);
    H=H+G;
    E=vertcat(E,H);
    %dlmwrite('circle[i].new',E,' ');
end
for i=1:N
    theta=(i*d/R);
    R_new=R*(cos(theta));
    Z=-R*(sin(theta));
    n=round((2*pi*R_new/d));
    t=[0:n]';
       A=R_new*cos(2*pi*t/n);
       B=R_new*sin(2*pi*t/n);
       plot(R_new*cos(2*pi*t/n),R_new*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n+1,1);
    I=horzcat(C,D);
    F=[0 0 0];
    G=repmat(F,n+1,1);
    I=I+G;
    E=vertcat(E,I);
    
    %dlmwrite('circle[i].new',E,' ');
end
dlmwrite('test.txt',E,' ');

