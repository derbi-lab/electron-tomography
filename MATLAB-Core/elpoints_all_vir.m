clear;
% this script will generate points that are 'd' distance apart over a
% Ellipsoid shaped virion
%-------------------------------------------------------------------------------------------------------------
% The dimention of the tomogram
X=840;
Y=840;
Z=240;
ptmat=[];
%..............................................................................................................
%V=load('picked_12_points_new.pos');
%V=load('vir-1.pos');
%V=load('ZJ-points.pos');
% First calculate the tilt angle of the ellipse
%V=load('all.pos');
V=load('ZJ.pos');
nx=size(V,1);
k=nx/4;
base_name='SIV_';
suffix='.pos';
% This tilt angle is the same for each virion
%theta=angle_calc_all(V);
%theta = (theta*180)/pi;
%Read the height matrix
Height=load('height.txt');
%..................................................
%calculate radius of each HIV virions for Zongjun
for l=1:k
    j=l-1;
x1=V(4*j+1,1);
y1=V(4*j+1,2);
z1=V(4*j+1,3);
x2=V(4*j+2,1);
y2=V(4*j+2,2);
z2=V(4*j+2,3);
x3=V(4*j+3,1);
y3=V(4*j+3,2);
z3=V(4*j+3,3);
x4=V(4*j+4,1);
y4=V(4*j+4,2);
z4=V(4*j+4,3);
V_indv=[x1 y1 z1; x2 y2 z2; x3 y3 z3; x4 y4 z4];
dlmwrite('V_indv.txt',V_indv,' ');
d1=sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
d2=sqrt((x3-x4)*(x3-x4) + (y3-y4)*(y3-y4));
%....................................................
% if(d1>d2)
%     a=d1;
%     b=d2;
% else
%     a=d2;
%     b=d1;  
% end
a=d1/2;
b=d2/2;
% a=a/2;
% b=b/2;
%calculating the angle
theta=angle_calc_all(V_indv);
theta = (theta*180)/pi;
%calculating the center of the ellipse
%
%
%calculate gradients
m1=(y2-y1)/(x2-x1);
m2=(y4-y3)/(x4-x3);
%equation of the lines
%m1*x-y+V(1,2)-m1*V(1,1)
%m2*x-y+V(3,2)-m1*V(3,1)
% the intersection of these two lines 
xc=((y1-m1*x1)-(y3-m2*x3))/(m2-m1);
yc=-(m1*(y3-m2*x3)-m2*(y1-m1*x1))/(m2-m1);
zc=V(4*j+1,3);
center=[xc yc zc]
%
j=num2str(l);
%--------------------------------------------------------------------------------------------------------------
%The spike head radius
d=5;
%the third axis of the outer ellipse
%c=Height(l)
c=68
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
%Pts = calculateEllipse(b,a,theta);
nx=size(Pts,1);
Z=0;      
D=repmat(Z,nx,1);
E=horzcat(Pts,D);
F=[xc yc zc];
G=repmat(F,nx,1);
E=E+G;
%dlmwrite('ellipse_0.pos',E,' ');
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
    Pts = calculateEllipse(a_new,b_new,theta);
    %Pts = calculateEllipse(a_new,b_new,theta);
    nx=size(Pts,1);
    if((zc-c<=Z_a+zc)&&(Z_a+zc<=zc+c))
    D=repmat(Z_a,nx,1);
    H=horzcat(Pts,D);
    F=[xc yc zc];
    G=repmat(F,nx,1);
    H=H+G;
    E=vertcat(E,H);
    end
end
%dlmwrite('ellipse_upper_half.pos',E,' ');
for i=1:N
    theta_a=(i*2*pi*d/P_a);
    theta_b=(i*2*pi*d/P_b);
    R_a = sqrt(a.^2+(i*d)^2);
    R_b = sqrt(b.^2+(i*d)^2);
    a_new = (i*d/tan(theta_a));
    b_new = (i*d/tan(theta_b));
    Z_a=i*d;
    Z_b=i*d;
    %call the function
    Pts = calculateEllipse(a_new,b_new,theta);
    %Pts = calculateEllipse(b_new,a_new,theta);
    nx=size(Pts,1);
    if((zc-c<=Z_a+zc)&&(Z_a+zc<=zc+c))
    D=repmat(-Z_a,nx,1);
    I=horzcat(Pts,D);
    F=[xc yc zc];
    G=repmat(F,nx,1);
    I=I+G;
    E=vertcat(E,I);
    end
end
%dlmwrite('ellipse_lower_half.pos',E,' ');
n=size(E,1)
dist=5;
for m=1:n
    if (E(m,1)>=(-X/2+dist)) && (E(m,1)<=(X/2-dist) && (E(m,2)>=(-Y/2+dist) && (E(m,2)<=(Y/2-dist))))
        ptmat=[ptmat;[E(m,1) E(m,2) E(m,3)]];
    end
end
file_name=strcat(base_name,j,suffix);
%dlmwrite(file_name,E,' ');
dlmwrite(file_name,ptmat,' ');
end