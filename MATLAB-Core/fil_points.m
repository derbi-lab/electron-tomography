% this code generated pointsthat are oriented in a certain angle and also recalculetes the initial ritation matrix accordingly 

format longE
% center of the virion
x0=300;
y0=0;
z0=128;
% position of the point before alignment
%X1=load('shifted_pts_raw_vir00.txt');
%X2=load('shifted_pts_ali_vir00.txt');
%A=load('rotation_vir00.txt');
%n = size(X1,1);
%for i=1:n,
x2=512;
y2=0;
z2=128;
% position of the point after alignment
x1=512;
y1=25;
z1=128;
% the first radial vector
r1=sqrt(((x1-x0).^2)+((y1-y0).^2)+((z1-z0).^2))
u_vec1=[];
u_vec1=[u_vec1; (x1-x0)./r1 (y1-y0)./r1 (z1-z0)./r1]
% the second radial vector
r2=sqrt(((x2-x0).^2)+((y2-y0).^2)+((z2-z0).^2))
u_vec2=[];
u_vec2=[u_vec2; (x2-x0)./r2 (y2-y0)./r2 (z2-z0)./r2]
% angle between two radial vectors
dot_prod=((x1-x0)*(x2-x0))+((y1-y0)*(y2-y0))+((z1-z0)*(z2-z0));
%norm1=r1.^2;
%norm2=r2.^2;
norm1=r1;
norm2=r2;
theta=acos((dot_prod)/(norm1*norm2))
theta1=pi-theta
cos(theta)