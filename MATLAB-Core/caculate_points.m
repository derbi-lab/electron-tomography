% this is a defunct code not used any more and the code picks points from a sphere with radius R and the points are D
% distance apart and also the cicles over the sphere are D distance apart
D=9.0826;
R=66.6750;
%no of cicles in one hemisphere
S=(pi*R)/2;
N=round(S/D);
n=round(2*pi*R/D);
% points in one circle
Z=0;
t=[0:n-1]'
       A=R*cos(2*pi*t/n);
       B=R*sin(2*pi*t/n);
       plot(R*cos(2*pi*t/n),R*sin(2*t*pi/n),'o')
D=repmat(Z,n,1);
E=horzcat(C,D);
F=[465.15 485.1 120];
G=repmat(F,m,1);
E=E+G;
dlmwrite('circle_0.new',E,' ');
% points on other circles
for i=1:N
    theta=(i*D/R)
    R=R*(cos(theta))
    Z=R*sin(theta)
    n=round(2*pi*R/D)
    t=[0:n-1]'
       A=R*cos(2*pi*t/n);
       B=R*sin(2*pi*t/n);
       plot(R*cos(2*pi*t/n),R*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n,1);
    E=horzcat(C,D);
    F=[465.15 485.1 120];
    G=repmat(F,m,1);
    E=E+G;
    dlmwrite('circle_i.new',E,' ');
end