% this script will generate a rectangular mesh grid
%--------------------------------------------------------------------------
% the dimension of the rectangular block(i.e dimension of the tomogram)
X=500;
Y=500;
Z=170;
%--------------------------------------------------------------------------
%the spacing between the points
d=6;
ptmat = [];
for h=86:d:Z
   for i=10:d:X
       for j=10:d:Y
            ptmat=[ptmat;[i j h]];
       end
   end
    size(ptmat);
end
ptmat;
size(ptmat)
dlmwrite('hESg2t7_bin4_new.pos',ptmat,' ');
