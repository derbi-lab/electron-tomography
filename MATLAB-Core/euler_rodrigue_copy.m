% this code is to calculate the new orientation of the subvolume along the
% new radial direction after the translational alignment
format longE
% center of the virion
x=[-222.62 38.983 5];
x0=x(1,1);
y0=x(1,2);
z0=x(1,3);
% position of the point before alignment
%X1=load('shifted_pts_raw_vir01.txt');
%X2=load('shifted_pts_ali_vir01.txt');
X1=load('SIVKT11SEPT18_20vir05.pos');
X2=load('shifted_pts_vir05.pos');
A=load('rotation_vir_05.txt');
n = size(X1,1);
Final=[];
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
u_vec1=[u_vec1; (x1-x0)/r1 (y1-y0)/r1 (z1-z0)/r1];
% the second radial vector
r2=sqrt(((x2-x0).^2)+((y2-y0).^2)+((z2-z0).^2));
u_vec2=[];
u_vec2=[u_vec2; (x2-x0)/r2 (y2-y0)/r2 (z2-z0)/r2];
% angle between two radial vectors
%dot_prod=((x1-x0)*(x2-x0))+((y1-y0)*(y2-y0))+((z1-z0)*(z2-z0));
dot_prod=dot(u_vec1,u_vec2);
norm1=norm(u_vec1);
norm2=norm(u_vec2);
%theta=acos((dot_prod)/(norm1*norm2))
theta=acos(dot_prod);
% axis of rotation
%cross_prod1=(y1-y0)*(z2-z0)-(z1-z0)*(y2-y0);
%cross_prod2=(x2-x0)*(z1-z0)-(x1-x0)*(z2-z0);
%cross_prod3=(x1-x0)*(y2-y0)-(xs2-x0)*(y1-y0);
cross_prod=cross(u_vec1,u_vec2);
%k=sqrt((cross_prod1.^2)+(cross_prod2.^2)+(cross_prod3.^2))
%kx=cross_prod1/k
%ky=cross_prod2/k
%kz=cross_prod3/k
kx=cross_prod(1,1);
ky=cross_prod(1,2);
kz=cross_prod(1,3);
% the eular rodrigue's parameters
a=cos(theta/2);
b=kx*(sin(theta/2));
c=ky*(sin(theta/2));
d=kz*(sin(theta/2));
% the rotation matrix 
%fprintf('\n Computing R %f %f %f %f \n',a,b,c,d);
R=[a*a+b*b-c*c-d*d 2*(b*c-a*d) 2*(b*d+a*c);2*(b*c+a*d) a*a-b*b+c*c-d*d 2*(c*d-a*b);2*(b*d-a*c) 2*(c*d+a*b) a*a-b*b-c*c+d*d];
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
R_new=R_new';
F=reshape(R_new,1,9);
Final=[Final;F];
end
dlmwrite('final_rotation_vir_05.txt',Final,'delimiter',' ','precision','%.16f')
