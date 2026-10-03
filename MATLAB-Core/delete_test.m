% this code deletes the points that are to be within 3 pixels from the the points that are picked later in the positions that we want to delete 
%small file(i.e original file)
A=dlmread('d1g1t15_bin2_calculated.pos');
%big file(i.e file  after picking positions sthat are to be deleted)
B=dlmread('d_extra.pos');
%x=size(A,1)
%extra points
C=setdiff(B,A,'rows');
nx=size(C,1)
%dist calculation
dist=[];
for i=1:nx
    x=size(A,1);
       dist=sqrt(sum((repmat(C(i,:),x,1)-A).^2,2));
       dist=[dist;[dist]];
       for j=1:x
           if(dist(j)<=3)
               A1=A(1:j-1,:);
               size(A1);
               A2=A(j+1:end,:);
               size(A2);
               A=vertcat(A1,A2);
           end
       end     
end
size(A)
dlmwrite('d1g1t15_bin2_calculated.pos',A,' ');

