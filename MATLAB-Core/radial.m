% this code is to calculate the new orientation of the subvolume along the
% new radial direction after the translational alignment
format longE
% center of the virion
x0=0;
y0=0;
z0=0;
% position of the point before alignment
X1=load('shifted_pts_raw_vir00.txt');
X2=load('shifted_pts_ali_vir00.txt');
A=load('rotation_vir00.txt');
n = size(X1,1);
for i=1:n,
x1=X1(i,1);
y1=X1(i,2);
z1=X1(i,3);
% position of the point after alignment
x2=X2(i,1);
y2=X2(i,2);
z2=X2(i,3);
% the firsts radial vector
r1=sqrt(((x1-x0).^2)+((y1-y0).^2)+((z1-z0).^2));
u_vec1=[];
u_vec1=[u_vec1; (x1-x0)./r1 (y1-y0)./r1 (z1-z0)./r1];
% the second radial vector
r2=sqrt(((x2-x0).^2)+((y2-y0).^2)+((z2-z0).^2));
u_vec2=[];
u_vec2=[u_vec2; (x2-x0)./r2 (y2-y0)./r2 (z2-z0)./r2];
% angle between two radial vectors
dot_prod=((x1-x0)*(x2-x0))+((y1-y0)*(y2-y0))+((z1-z0)*(z2-z0));
norm1=r1.^2;
norm2=r2.^2;
theta=acos((dot_prod)/(norm1*norm2))
% axis of rotation
cross_prod1=(y1-y0)*(z2-z0)-(z1-z0)*(y2-y0);
cross_prod2=(x2-x0)*(z1-z0)-(x1-x0)*(z2-z0);
cross_prod3=(x1-x0)*(y2-y0)-(x2-x0)*(y1-y0);
k=sqrt((cross_prod1.^2)+(cross_prod2.^2)+(cross_prod3.^2));
kx=cross_prod1/k;
ky=cross_prod2/k;
kz=cross_prod3/k;
% the eular rodrigue's parameters
a=cos(theta/2);
b=kx*(sin(theta/2));
c=ky*(sin(theta/2));
d=kz*(sin(theta/2));
% the rotation matrix 
R=[a*a+b*b-c*c-d*d 2*(b*c-a*d) 2*(b*d+a*c);2*(b*c+a*d) a*a-b*b+c*c-d*d 2*(c*d-a*b);2*(b*d-a*c) 2*(c*d+a*b) a*a-b*b-c*c+d*d]
% the existing rotation matrix
a11=A(i,1);
a12=A(i,2);
a13=A(i,3);
a21=A(i,4);
a22=A(i,5);
a23=A(i,6);
a31=A(i,7);
a32=A(i,8);
a33=A(i,9);
R_old=[a11 a12 a13;a21 a22 a23;a31 a32 a33];
%final rotation matrix
R_new=[];
R_new=[R_new;R*R_old];
F=[];
%f_m=[f_m; f_m=R_new(1,1) R_new(1,2) R_new(1,3) R_new(2,1) R_new(2,2) R_new(2,3) R_new(3,1) R_new(3,2) R_new(3,3)]; 
F(i,1)=R_new(1,1);
F(i,2)=R_new(1,2);
F(i,3)=R_new(1,3);
F(i,4)=R_new(2,1);
F(i,5)=R_new(2,2);
F(i,6)=R_new(2,3);
F(i,7)=R_new(3,1);
F(i,8)=R_new(3,2);
F(i,9)=R_new(3,3);
F=[F; F(i,1) F(i,2) F(i,3) F(i,4) F(i,5) F(i,6) F(i,7) F(i,8) F(i,9)];
end
F






















