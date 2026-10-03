%this script computes the random euler angles
ptmat=[];
%d=9.4;
%d=18;
d=31.858
for i=0:d:180
    for j=0:d:180
        for k=0:d:180
            ptmat=[ptmat;[i j k]];
        end
    end
end
%for i=-180:d:180
 %   for j=-180:d:180
  %      for k=-180:d:180
  %           ptmat=[ptmat;[i j k]];
   %     end
    %end
%end
size(ptmat)
%dlmwrite('random_angles_test_test.dat',ptmat,' ');
dlmwrite('random_angles_chrom-180.dat',ptmat,' ');