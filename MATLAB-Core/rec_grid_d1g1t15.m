% this script will generate a rectangular mesh grid
%--------------------------------------------------------------------------
% the dimension of the rectangular block(i.e dimension of the tomogram)
X=506;
Y=506;
Z=97;
%--------------------------------------------------------------------------
%the spacing between the points
d=6;
ptmat = [];
for h=20:d:Z
   for i=12:d:X
       for j=12:d:Y
            ptmat=[ptmat;[i j h]];
       end
   end
    size(ptmat);
end
ptmat;
size(ptmat)
dlmwrite('d1g1t15_bin4.pos',ptmat,' ');
