clear;
% this script will generate points that are 'd' distance apart over a
% Ellipsoid shaped virion
%-------------------------------------------------------------------------------------------------------------
V=load('picked_12_points_new.pos');
theta=angle_calc(V)
%for i=1:2:8
i=1;
d1=sqrt((V(i,1)-V(i+1,1)).^2 + (V(i,2)-V(i+1,2)).^2)
d2=sqrt((V(i+2,1)-V(i+3,1)).^2 + (V(i+2,2)-V(i+3,2)).^2)
if(d1>d2)
    a=d1;
    b=d2;
else
    a=d2;
    b=d1;
    
end
a=a/2;
b=b/2;
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
d=18.1652;
%the third axis z
c=84;
c=c/2;
%perimeter of the outer ellipse
S=pi*(3/2*(c+a)+sqrt(c*a))/4;
%no of ellipses in one half
N=round(S/d)
% points in the 0th ellipse
% the semimajor and semi mior axes of the central ellipse
a
b
% call ellipse point generation code
Pts = calculateEllipse_old(a,b);
nx=size(Pts,1);
Z=0;       
D=repmat(Z,nx,1);
E=horzcat(Pts,D);
F=[xc yc zc];
G=repmat(F,nx,1);
E=E+G;
dlmwrite('ellipse_0.pos',E,' ');
R=[cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
E_rotate=[];
for i=1:nx
    E_new=R*E(i,:)';
    E_new=E_new';
    E_rotate=[E_rotate;E_new];
end
dlmwrite('ellipse_0_rotate.pos',E_rotate,' ');




%---------------------------------------------------------------------------------------------------------------
% points on other ellipses
% for i=1:N
%     % computation of semi major and semi minor axis of ellipses
%     P_a = pi*(3/2*(c+a)+sqrt(c*a));
%     P_b = pi*(3/2*(c+b)+sqrt(c*b));
%     theta_a=(i*2*pi*d/P_a);
%     theta_b=(i*2*pi*d/P_b);
%     R_a = sqrt(a.^2+(i*d)^2);
%     R_b = sqrt(b.^2+(i*d)^2);
%     %a_new=R_a*(cos(theta_a))
%     a_new = abs(i*d/tan(theta_a))
%     %b_new=R_b*(cos(theta_b))
%     b_new = abs(i*d/tan(theta_b))
%     %Z_a=R_a*(sin(theta_a));
%     Z_a=i*d;
%     %Z_b=R_b*(sin(theta_b));
%     Z_b=i*d;
%     % call the function
%     Pts = calculateEllipse_old(a_new,b_new);
%     nx=size(Pts,1);
%     D=repmat(Z_a,nx,1);
%     H=horzcat(Pts,D);
%     F=[xc yc zc];
%     G=repmat(F,nx,1);
%     H=H+G;
%     E=vertcat(E,H);
%     
%     %dlmwrite('circle[i].new',E,' ');
% end
% for i=1:N
%     P_a = pi*(3/2*(c+a)+sqrt(c*a));
%     P_b = pi*(3/2*(c+b)+sqrt(c*b));
%     theta_a=(i*2*pi*d/P_a);
%     theta_b=(i*2*pi*d/P_b);
%     R_a = sqrt(a.^2+(i*d)^2);
%     R_b = sqrt(b.^2+(i*d)^2);
%     %a_new=R_a*(cos(theta_a));
%     a_new = i*d/tan(theta_a);
%     %b_new=R_b*(cos(theta_b));
%     b_new = i*d/tan(theta_b);
%     %Z_a=R_a*(sin(theta_a));
%     Z_a=i*d;
%     %Z_b=R_b*(sin(theta_b));
%     Z_b=i*d;
%     %call the function
%     Pts = calculateEllipse_old(a_new,b_new);
%     nx=size(Pts,1);
%     D=repmat(-Z_a,nx,1);
%     I=horzcat(Pts,D);
%     F=[xc yc zc];
%     G=repmat(F,nx,1);
%     I=I+G;
%     E=vertcat(E,I);
% end
% size(E)
% dlmwrite('points_vir01_ellipse.txt',E,' ');
% %end