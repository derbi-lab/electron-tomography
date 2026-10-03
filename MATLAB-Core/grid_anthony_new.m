% this script will generate a rectangular mesh grid excluding some area
% the dimension of the rectangular block(i.e dimension of the tomogram)
%X=1842;
%Y=1791;
%Z=396;
% read the existinf point file
V=load('points_fil_corrected_gap_new.txt');
nx=size(V,1)
ny=size(V,2)
%-------------------------------------------------------------------------
% equation of the first line
%5.106x-y-1429.68=0;
%another measurement
%-6.3x-y+1957=0
%equation of the second line
%another measurment
%-5.248x-y+2639.744=0;
%-4.693x-y+2226.482=0;
%-------------------------------------------------------------------------
%the spacing between the points
ptmat=[];
for i=1:nx
           %------------check the condition-----------------------
           %d1=-5.106*V(i,1)-V(i,2)+1429.68;
           %d2=-5.248*V(i,1)-V(i,2)+2639.744;
           d1=-6.3*V(i,1)-V(i,2)+1957;
           d2=-4.693*V(i,1)-V(i,2)+2226.482;
           %for region 1
           if(d1>0)
              ptmat=[ptmat;[V(i,1) V(i,2) V(i,3)]];
           end 
           %for region 2
           %if(d2<0)
           %   ptmat=[ptmat;[V(i,1) V(i,2) V(i,3)]];
           %end 
           %for middle region
                %if((d1<=0)&&(d2>=0))
                 %       ptmat=[ptmat;[V(i,1) V(i,2) V(i,3)]];
                %end
           
end                 
ptmat;
size(ptmat)
dlmwrite('region1_new.pos',ptmat,' ');