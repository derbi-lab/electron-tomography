function theta = angle_calc_all(V)
    format longE
    % position of the 12 picked points
    %V=load('picked_12_points_new.pos');
    %V=load('vir-2.pos');
    %V=load('ZJ-points.pos');
    %V=load('V_indv.txt')
%     nx=size(V,1);
%     k=nx/4;
%     for i=1:k
%     j=i-1;
%     x0=V(4*j+1,1);
%     y0=V(4*j+1,2);
%     z0=V(4*j+1,3);
%     x1=V(4*j+2,1);
%     y1=V(4*j+2,2);
%     z1=V(4*j+2,3);
%     x2=x1;
%     y2=y1+200;
%     z2=z1;
    n = size(V,1);
    x0=V(1,1);
    y0=V(1,2);
    z0=V(1,3);
    x1=V(2,1);
    y1=V(2,2);
    z1=V(2,3);
    x2=x1;
    y2=y1+200;
    z2=z1;
    % the first radial vector
    r1=sqrt(((x1-x0).^2)+((y1-y0).^2)+((z1-z0).^2));
    u_vec1=[];
    u_vec1=[u_vec1; (x1-x0)./r1 (y1-y0)./r1 (z1-z0)./r1];
    % the second radial vector
    %r2=sqrt(((x2-x0).^2)+((y2-y0).^2)+((z2-z0).^2));
    r2=sqrt(((x1-x2).^2)+((y1-y2).^2)+((z1-z2).^2));
    u_vec2=[];
    %u_vec2=[u_vec2; (x2-x0)./r2 (y2-y0)./r2 (z2-z0)./r2];
    u_vec2=[u_vec2; (x1-x2)./r2 (y1-y2)./r2 (z1-z2)./r2];
    % angle between two radial vectors
    %dot_prod=((x1-x0)*(x2-x0))+((y1-y0)*(y2-y0))+((z1-z0)*(z2-z0));
    dot_prod=((x1-x0)*(x1-x2))+((y1-y0)*(y1-y2))+((z1-z0)*(z1-z2));
    %norm1=r1.^2;
    %norm2=r2.^2;
    norm1=r1;
    norm2=r2;
    theta=acos((dot_prod)/(norm1*norm2))
    theta=pi/2-theta
    %end
%     cos(theta);
end