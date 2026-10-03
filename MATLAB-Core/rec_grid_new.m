% this script will generate a rectangular mesh grid

% the dimension of the rectangular block(i.e dimension of the tomogram)
%X=1842;
%Y=1791;
%Z=396;
X=921;
Y=895;
Z=180;

%-------------------------------------------------------------------------
% equation of the first line
%equation of the second line
%-------------------------------------------------------------------------
%the spacing between the points
d=6;
s=20;
ptmat = [];
for h=20:d:Z-s
   for i=20:d:X-s
       i
       for j=20:d:Y-s
           j
           %------------check the condition-----------------------
           d1=1.2787*i-j-14.18;
           d2=1.1974*i-j-356.8122;
           %if(d1<0)
           if(d1>0)
           ptmat=[ptmat;[i j h]];
                %elseif((d1>=0)&&(d2<=0))
                 elseif((d1<=0)&&(d2>=0))
                j=j+1;
                   % elseif((d1>0)&&(d2>0))
                    elseif((d1<0)&&(d2<0))
                   ptmat=[ptmat;[i j h]];
           end
       end 
   end
    size(ptmat)
 end
ptmat;
size(ptmat)
dlmwrite('NEW_REC_GRID_FIL.txt',ptmat,' ');