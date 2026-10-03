%read the size of the image
I=ReadMRC('out-030-000.mrc');
nx=size(I,1)
ny=size(I,2)
%subvolume size
n=16;
%total number of images
a=round(nx/n);
b=round(ny/n);
N=a*b;
%read the file contating the coordinate of the clicked poisitions
V=load('im0.pos');
size(V);
%find out the index of those subvolumes
Ind=[];
for i=1:size(V,1)
    for j=1:size(V,2)
        m=ceil((nx/V(i,j))-1)
        n=ceil((ny/V(i,j))-1)
        indx=m*n;
        Ind=[Ind;indx];
    end
end 
dlmwrite('index_file.txt',Ind)
%call deletelines.py for deleting those lines