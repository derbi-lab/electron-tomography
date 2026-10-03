clear;
% this script will generate points that are 'd' distance apart over a
% Ellipsoid shaped virion
%-------------------------------------------------------------------------------------------------------------
%V=load('picked_12_points_new.pos');
%V=load('vir-2.pos');
V=load('test.pos');
% First calculate the tilt angle of the ellipse
% This tilt angle is the same for each virion
theta=angle_calc(V);
theta = (theta*180)/pi;
%for i=1:2:8
i=1;
d1=sqrt((V(i,1)-V(i+1,1)).^2 + (V(i,2)-V(i+1,2)).^2);
d2=sqrt((V(i+2,1)-V(i+3,1)).^2 + (V(i+2,2)-V(i+3,2)).^2);
% if(d1>d2)
%     a=d1;
%     b=d2;
% else
%     a=d2;
%     b=d1;
%    
% end
% a=a/2;
% b=b/2;
a=d1/2
b=d2/2
%calculating the center of the ellipse
%
%
%calculate gradients
m1=(V(2,2)-V(1,2))/(V(2,1)-V(1,1));
m2=(V(4,2)-V(3,2))/(V(4,1)-V(3,1));
%equation of the lines
%m1*x-y+V(1,2)-m1*V(1,1)
%m2*x-y+V(3,2)-m1*V(3,1)
% the intersection of these two lines 
xc=((V(1,2)-m1*V(1,1))-(V(3,2)-m2*V(3,1)))/(m2-m1)
yc=-(m1*(V(3,2)-m2*V(3,1))-m2*(V(1,2)-m1*V(1,1)))/(m2-m1)
zc=V(i,3);
c=[xc yc zc]
%--------------------------------------------------------------------------------------------------------------
%d=9.0826;
d=5;
%the third axis of the outer ellipse
%c=84;
c=45;
%
%
%perimeter of the outer ellipse
%S=(pi*(3/2*(c+a)+sqrt(c*a)))/4
%Ramanujan's approximation
S=(pi*(3*(c+a)-sqrt((3*c+a)*(c+3*a))))./4;
%
%
%no of ellipses in one half
N=floor(S/d)
% points in the 0th ellipse
% the semimajor and semi mior axes of the central ellipse
a
b
% Call ellipse point generation code
Pts = calculateEllipse(a,b,theta);
nx=size(Pts,1);
Z=0;      
D=repmat(Z,nx,1);
E=horzcat(Pts,D);
F=[xc yc zc];
G=repmat(F,nx,1);
E=E+G;
dlmwrite('ellipse_0.pos',E,' ');
%perometer of the ellipses
% P_a = pi*(3/2*(c+a)+sqrt(c*a));
% P_b = pi*(3/2*(c+b)+sqrt(c*b));
%Ramanujan's approximation
    P_a=pi*(3*(c+a)-sqrt((3*c+a)*(c+3*a)));
    P_b=pi*(3*(c+b)-sqrt((3*c+b)*(c+3*b)));
%---------------------------------------------------------------------------------------------------------------
% points on other ellipses
for i=1:N
    % computation of semi major and semi minor axis of ellipses
    %
    %
    theta_a=(i*2*pi*d/P_a);
    theta_b=(i*2*pi*d/P_b);
    %
    %
    %.............................................................................................................
    R_a = sqrt(a.^2+(i*d).^2);
    R_b = sqrt(b.^2+(i*d).^2);
    a_new = (i*d/tan(theta_a));
    b_new = (i*d/tan(theta_b));
    Z_a=i*d;
    Z_b=i*d;
    % call the function
    %a_new=a_new/2
    %b_new=b_new/2
    Pts = calculateEllipse(a_new,b_new,theta);
    nx=size(Pts,1);
    if((zc-c<=Z_a+zc)&&(Z_a+zc<=zc+c))
        Z_a
    D=repmat(Z_a,nx,1);
    H=horzcat(Pts,D);
    F=[xc yc zc];
    G=repmat(F,nx,1);
    H=H+G;
    E=vertcat(E,H);
    end
    %dlmwrite('circle[i].new',E,' ');
end
dlmwrite('ellipse_upper_half.pos',E,' ');
for i=1:N
    theta_a=(i*2*pi*d/P_a);
    theta_b=(i*2*pi*d/P_b);
    R_a = sqrt(a.^2+(i*d)^2);
    R_b = sqrt(b.^2+(i*d)^2);
    a_new = abs(i*d/tan(theta_a));
    b_new = abs(i*d/tan(theta_b));
    %a_new=a_new/2;
    %b_new=b_new/2;
    Z_a=i*d;
    Z_b=i*d;
    %call the function
    Pts = calculateEllipse(a_new,b_new,theta);
    nx=size(Pts,1);
    if((zc-c<=Z_a+zc)&&(Z_a+zc<=zc+c))
        Z_a
    D=repmat(-Z_a,nx,1);
    I=horzcat(Pts,D);
    F=[xc yc zc];
    G=repmat(F,nx,1);
    I=I+G;
    E=vertcat(E,I);
    end
end
%dlmwrite('ellipse_lower_half.pos',E,' ');
size(E)
dlmwrite('points-ZJ-2.txt',E,' ');
%end