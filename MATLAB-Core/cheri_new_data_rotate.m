% this script will generate a rectangular mesh grid
%--------------------------------------------------------------------------
% the dimension of the rectangular block(i.e dimension of the tomoz
V=load('points-37-hESg2t7.txt');
X=[26 33 82];
V=V/2;
Y=repmat(X,size(V,1),1);
Z=V+Y;
nx=size(Z,1);
ny=size(Z,2);
%dlmwrite('points-37-bin4-hESg2t7.txt',Z,' ');
%theta=1.570796195613371;
%theta=1.570796457976422;
theta=1.173824172474984e-01;
%theta1=pi/2-theta;
%rotation along z
%R=[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
%rotation along y
%R=[cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)]
%R=[cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]
%rotation along x
%R=[1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]
%rotation along x in 2D plane
%R=[cos(theta) -sin(theta); sin(theta) cos(theta)];
R=[cos(theta) sin(theta); -sin(theta) cos(theta)];
ptmat = [];
for h=1:nx
             vec=R*[V(h,1) V(h,2)]';
             v=vec';
             %to prevent the points to fall beyond the map
             %if (v(1,1)>=20) && (v(1,1)<=700) && (v(1,2)>=20) && (v(1,2)<=700)
            %if(i<=719)
             %vec=vec';
             %v=vec';
             vec=[v V(h,3)];
            %ptmat=[ptmat;[i j h]];
            ptmat=[ptmat;vec];
            %ptmat=[ptmat;[i j h]];
            %ptmat=R*ptmat';
            %ptmat=ptmat'
end
   
    size(ptmat);
ptmat;
size(ptmat)
dlmwrite('points-37-bin4-hESg2t7.txt',ptmat,' ');