clear;
base_name='SIV_040_vir';
suffix1='.pos';
suffix2='.out';
for j=1:19
   l=num2str(j);
   file_name_in=strcat(base_name,l,suffix1);
   file_name_out=strcat(base_name,l,suffix2);
   V=load('file_name_in');
   nx=size(V,1);
   V_int=[];
for i=1:nx
 V_int=[V_int ; [floor(V(i,1)) floor(V(i,2)) floor(V(i,3))]];
end
 dlmwrite(file_name_out,V_int,' ');
end
