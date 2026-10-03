clear;
% this script will generate points that are 'd' distance apart over a
% Ellipsoid shaped virion
%-------------------------------------------------------------------------------------------------------------
% The dimention of the tomogram
X=864;
Y=864;
Z=216;
%X=882;
%Y=770;
%Z=280;
%............................................................................................................
V=load('PICKED-POINTS-ALL-VIR.pos');
% First calculate the tilt angle of the ellipse
%V=load('z-228-vir5.pos');
%V=load('my-new-points.pos');
nx=size(V,1);
k=nx/6;
base_name='SIV_040_test';
%base_name='gif111117hiv_228_fresh';
suffix='.pos';
% This tilt angle is the same for each virion
%theta=angle_calc_all(V);
%theta = (theta*180)/pi;
%Read the height matrix
%Height=load('height-siv40.txt');
Height=[];
%..................................................
%calculate radius of each HIV virions for Zongjun
for l=1:k
    %...........................................
    %Height calculation
    %...........................................
    h1=V((l-1)*6+1,3)
    h2=V((l-1)*6+2,3)
    if(h1>h2)
        h1=h1-10;
        h2=h2+10;
    else
        h1=h1+10;
        h2=h2-10;
    end    
    h=abs((h1-h2)/2)
    Height=[Height;[h]];
end
dlmwrite('Height040.txt',Height,' ');
    %...........................................
for l=1:k
    j=l-1;
    E=[];
    ptmat=[];
    row=3*(j*2+1);
    x1=V(row,1);
    y1=V(row,2);
    z1=V(row,3);
    x2=V(row+1,1);
    y2=V(row+1,2);
    z2=V(row+1,3);
    x3=V(row+2,1);
    y3=V(row+2,2);
    z3=V(row+2,3);
    x4=V(row+3,1);
    y4=V(row+3,2);
    z4=V(row+3,3);
    V_indv=[x1 y1 z1; x2 y2 z2; x3 y3 z3; x4 y4 z4];
    dlmwrite('V_indv.txt',V_indv,' ');
    d1=sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
    d2=sqrt((x3-x4)*(x3-x4) + (y3-y4)*(y3-y4));
    r=((d1+d2)/2)/2
    theta=angle_calc_all(V_indv);
    % calculate the angle of the virion in degrees
    theta = (theta*180)/pi;
    %calculate gradients
    if(x2~=x1)
       m1=(y2-y1)/(x2-x1);
    end
   % if(x4~=x3)
       m2=(y4-y3)/(x4-x3);
   % end
       
    %equation of the lines
    %m1*x-y+V(1,2)-m1*V(1,1)
    %m2*x-y+V(3,2)-m1*V(3,1)
    % the intersection of these two lines 
    if(x2==x1)
        xc=x1;
        yc=y3+m2*(x1-x3);
        else
            xc=((y1-m1*x1)-(y3-m2*x3))/(m2-m1);
            yc=-(m1*(y3-m2*x3)-m2*(y1-m1*x1))/(m2-m1);
    end
    zc=V(row,3);
    center=[xc yc zc];
    dlmwrite('CENTER.dat',center,' ');
    j=num2str(l);
    %--------------------------------------------------------------------------------------------------------------
    %The spike head radius (Just Changed)
    %d=6;
    R=r;
    d=6;
    %the third axis of the outer ellipse
    c=Height(l);
    S=(pi*R)/2
%N=round(S/d)
N=ceil(S/d)
% points in the 0th circle
n=round(2*pi*R/d)
Z=0;
t=[0:n-1]';
       A=R*cos(2*pi*t/n);
       B=R*sin(2*pi*t/n);
       plot(R*cos(2*pi*t/n),R*sin(2*t*pi/n),'o')
C=horzcat(A,B);       
D=repmat(Z,n,1);
E=horzcat(C,D);
size(E)
%F=[0 0 0];
F=[xc yc zc];
G=repmat(F,n,1);
size(G)
E=E+G;
size(E)
% points on other circles
for i=1:N
    theta=(i*d/R);
    R_new=R*(cos(theta));
    Z=R*(sin(theta));
    n=round((2*pi*R_new/d));
    t=[0:n-1]';
       A=R_new*cos(2*pi*t/n);
       B=R_new*sin(2*pi*t/n);
       plot(R_new*cos(2*pi*t/n),R_new*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n,1);
    H=horzcat(C,D);
    %F=[0 0 0];
    F=[xc yc zc];
    G=repmat(F,n,1);
    H=H+G;
    E=vertcat(E,H);
end
for i=1:N
    theta=(i*d/R);
    R_new=R*(cos(theta));
    Z=-R*(sin(theta));
    n=round((2*pi*R_new/d));
    t=[0:n-1]';
       A=R_new*cos(2*pi*t/n);
       B=R_new*sin(2*pi*t/n);
       plot(R_new*cos(2*pi*t/n),R_new*sin(2*t*pi/n),'o')
    C=horzcat(A,B);
    D=repmat(Z,n,1);
    I=horzcat(C,D);
    %F=[0 0 0];
    F=[xc yc zc];
    G=repmat(F,n,1);
    I=I+G;
    E=vertcat(E,I);
end
file_name=strcat(base_name,j,suffix);
dlmwrite(file_name,E,' ');
end
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    