% this script will generate a rectangular mesh grid
%--------------------------------------------------------------------------
% the dimension of the rectangular block(i.e dimension of the tomogram)
X=1000;
Y=1000;
Z=80;
%--------------------------------------------------------------------------
% To get points for the lower half of the tomogram
%X=500;
%Y=500;
%Z=100;
%--------------------------------------------------------------------------
%the spacing between the points
%d=25;
%theta=1.570796195613371;
%theta=1.570796457976422;
theta=1.336833331201949;
theta1=pi/2-theta;
%rotation along z
%R=[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]
%rotation along y
%R=[cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)]
%R=[cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)]
%rotation along x
%R=[1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)]
%rotation along x in 2D plane
R=[cos(theta1) -sin(theta1); sin(theta1) cos(theta1)];
%R=[cos(theta) sin(theta); -sin(theta) cos(theta)];
ptmat = [];
for h=20:7:Z
   for i=-500:7:X
       %i
       for j=-500:31:Y
            %fprintf("For the value of x=%d",x)
            %vec=R*[i j h]'
             vec=R*[i j]';
             v=vec';
             %to prevent the points to fall beyond the map
             if (v(1,1)>=20) && (v(1,1)<=700) && (v(1,2)>=20) && (v(1,2)<=700)
            %if(i<=719)
             %vec=vec';
             %v=vec';
             vec=[v h];
            %ptmat=[ptmat;[i j h]];
            ptmat=[ptmat;vec];
            %ptmat=[ptmat;[i j h]];
            %ptmat=R*ptmat';
            %ptmat=ptmat';
             end
       end
   end
    size(ptmat);
end
ptmat;
size(ptmat)
dlmwrite('points_fil_corrected_gap_new.txt',ptmat,' ');