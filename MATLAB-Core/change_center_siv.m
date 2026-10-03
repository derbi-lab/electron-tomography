base_name='SIVKT11SEPT18_20vir';
suffix1='.pos';
suffix2='.txt';
for i=10:22
 j=num2str(i);
 file_name_in=strcat(base_name,j,suffix1);
 file_name_out=strcat(base_name,j,suffix2);
 V=load(file_name_in);
 U=[420 420 120];
 W=repmat(U,size(V,1),1);
 V=V+W;
 dlmwrite(file_name_out,V,' ');
end