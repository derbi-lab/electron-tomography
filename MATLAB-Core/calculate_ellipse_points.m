% this script will generate points that are 'd' distance apart over a
% Ellipsoid shaped virion
%-------------------------------------------------------------------------------------------------------------
V=load('picked_12_points.pos');
%for i=1:2:8
i=1;
d1=sqrt((V(i,1)-V(i+1,1)).^2 + (V(i,2)-V(i+1,2)).^2);
d2=sqrt((V(i+2,1)-V(i+3,1)).^2 + (V(i+2,2)-V(i+3,2)).^2);
if(d1>d2)
    a=d1;
    b=d2;
else
    a=d2;
    b=d1;
    
end
%calculating the center of the ellipse
xc=(V(i,1)-V(i+1,1))/2;
yc=(V(i+2,1)-V(i+3,1))/2;
zc=V(i,3);
c=[xc yc zc];
%--------------------------------------------------------------------------------------------------------------
%d=9.0826;
d=18.1652;
%the third axis z
c=100;
%perimeter of the outer ellipse
S=pi*(3/2*(c+a)+sqrt(c*a))/4;
%no of cicles in one half
N=round(S/d)
% points in the 0th ellipse
% the semimajor and semi mior axes of the central ellipse
a
b
% call ellipse point generation code
Pts = calculateEllipse(a,b);
nx=size(Pts,1);
Z=V(1,3);       
D=repmat(Z,nx,1);
E=horzcat(Pts,D);
F=[xc yc zc];
G=repmat(F,nx,1);
E=E+G;
dlmwrite('ellipse_0.pos',E,' ');
%---------------------------------------------------------------------------------------------------------------
% points on other ellipses
for i=1:N
    i
    % computation of semi major and semi minor axis of ellipses
    P_a = pi*(3/2*(c+a)+sqrt(c*a));
	P_b = pi*(3/2*(c+b)+sqrt(c*b));
    theta_a=(i*2*pi*d/P_a);
	theta_b=(i*2*pi*d/P_b);
	R_a = sqrt(a.^2+(i*d)^2);
	R_b = sqrt(b.^2+(i*d)^2);
    a_new=R_a*(cos(theta_a))
	b_new=R_b*(cos(theta_b))
    Z_a=R_a*(sin(theta_a));
	Z_b=R_b*(sin(theta_b));
	% call the function
    Pts = calculateEllipse(a_new,b_new);
    nx=size(Pts,1);
    D=repmat(Z_a,nx,1);
    H=horzcat(Pts,D);
    F=[xc yc zc];
    G=repmat(F,nx,1);
    H=H+G;
    E=vertcat(E,H);
    
    %dlmwrite('circle[i].new',E,' ');
end
for i=1:N
    P_a = pi*(3/2*(c+a)+sqrt(c*a));
	P_b = pi*(3/2*(c+b)+sqrt(c*b));
    theta_a=(i*2*pi*d/P_a);
	theta_b=(i*2*pi*d/P_b);
	R_a = sqrt(a.^2+(i*d)^2);
	R_b = sqrt(b.^2+(i*d)^2);
    a_new=R_a*(cos(theta_a));
	b_new=R_b*(cos(theta_b));
    Z_a=R_a*(sin(theta_a));
	Z_b=R_b*(sin(theta_b));
    %call the function
    Pts = calculateEllipse(a_new,b_new);
    nx=size(Pts,1);
    D=repmat(Z_a,nx,1);
    I=horzcat(Pts,D);
    F=[xc yc zc];
    G=repmat(F,nx,1);
    I=I+G;
    E=vertcat(E,I);
end
size(E)
dlmwrite('test_points_vir01_ellipse.txt',E,' ');
%end