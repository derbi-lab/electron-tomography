% this script will generate a rectangular mesh grid
%--------------------------------------------------------------------------
% the dimension of the rectangular block(i.e dimension of the tomogram)
%upper
%X=450;
%Y=219;
%Z=85;
%lower
X=1008;
Y=1008;
Z=180;
%--------------------------------------------------------------------------
% To get points for the lower half of the tomogram
%X=500;
%Y=500;
%Z=100;
%--------------------------------------------------------------------------
%the spacing between the points
d=15;
ptmat = [];
for h=45:d:Z
   for i=18:d:X
       %i
       for j=18:d:Y
            %fprintf("For the value of x=%d",x)
            ptmat=[ptmat;[i j h]];
       end
   end
    size(ptmat);
end
ptmat;
size(ptmat)
dlmwrite('d1g1t15_bin2.pos',ptmat,' ');
