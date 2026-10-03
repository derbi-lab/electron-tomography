V=load('class-49-bin2.txt');
nx=size(V,1);
V1=[];
for i=1:nx
    if((V(i,3)>-60)&&(V(i,3)<60))
       V1=[V1;[V(i,1) V(i,2) V(i,3)]];
    end
end
dlmwrite('class-49-bin2-range.txt',V1,' ');
        