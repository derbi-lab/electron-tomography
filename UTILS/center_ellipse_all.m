clear;
% this script will generate points that are 'd' distance apart over a
% Ellipsoid shaped virion
%-------------------------------------------------------------------------------------------------------------
%............................................................................................................
V=load('my-new-points.pos');
C=[];
nx=size(V,1);
k=nx/4;
%..................................................
%calculate radius of each HIV virions for Zongjun
for l=1:k
    j=l-1;
    E=[];
    ptmat=[];
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
    a=d1/2;
    b=d2/2;
    %calculating the center of the ellipse
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
    zc=V(4*j+1,3);
    center=[xc yc zc];
    C=[C;center];
end
    dlmwrite('center_vir_all.pos',C,' ');
