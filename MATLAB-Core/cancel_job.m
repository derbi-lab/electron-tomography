V=load('job_no.txt');
nx=size(V,1);
base_name='canceljob  ';
A=[];
for i=1:nx
   k=V(i);
   j=num2str(k);
   c=cellstr(j);
   file_name=strcat(base_name,c);
   A=[A;[file_name]];
end
size(A)
dlmwrite(cancel.txt,A,);