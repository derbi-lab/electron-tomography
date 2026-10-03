function delete_pts(main_file,manual_file,out_file)
% this code deletes the points that are to be within 3 pixels from the the points that are picked later in the positions that we want to delete 
%small file(i.e original file)
A=dlmread(main_file);
%big file(i.e file  after picking positions sthat are to be deleted)
B=dlmread(manual_file);
%x=size(A,1)
nx=size(A,1)
%dist calculation
dist=[];
for i=1:nx
    x=size(A,1);
       dist=sqrt(sum((repmat(A(i,:),x,1)-A).^2,2));
       dist=[dist;[dist]];
       for j=1:x
           if(dist(j+1) == 0 )
               A1=A(1:j,:);
               size(A1);
               A2=A(j+2:end,:);
               size(A2);
               A=vertcat(A1,A2);
           end
       end     
end
size(A)
dlmwrite(out_file,A,' ');

