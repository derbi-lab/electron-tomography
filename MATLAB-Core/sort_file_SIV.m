A=load('fixed-all-ali.trf');
D=unique(A,'rows');
B=sortrows(D,16);
%C=B(end:-1:1);
%C=flipud(B);
dlmwrite('sorted-all-ali.trf',B,' ');
nx=size(B,1);
F=[];
for i=1:nx
    if(B(i,16)>=0)
        F=[ F;B(i,:) ];
    end
end
dlmwrite('final-all-ali-positive.trf',F,' ');
