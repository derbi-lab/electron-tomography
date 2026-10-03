A=load('fixed-all-ali.trf');
D=unique(A,'rows');
B=sortrows(D,16);
%C=B(end:-1:1);
C=flipud(B);
dlmwrite('sorted-all-ali.trf',C,' ');
nx=size(C,1);
F=C(1:round((nx*70)/100),:);
size(F)
dlmwrite('final-all-ali.trf',F,' ');
