% this script will generate a rectangular mesh grid for the loer half of
% the tomogram
%--------------------------------------------------------------------------
% the dimension of the rectangular block(i.e dimension of the tomogram)
%X=1842;
%Y=1791;
%Z=396;
%--------------------------------------------------------------------------
% To get points for the lower half of the tomogram
X=450;
Y=220;
Z=85;
%--------------------------------------------------------------------------
%the spacing between the points
d=10;
ptmat = [];
for h=15:10:Z
   for i=10:d:X
       for j=10:d:Y
            %fprintf("For the value of x=%d",x)
            ptmat=[ptmat;[i j h]];
       end
   end
    size(ptmat);
end
ptmat;
size(ptmat)
dlmwrite('points_ribo_bin_4_lower.txt',ptmat,' ');