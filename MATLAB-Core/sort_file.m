A=load('fixed-mra-SIVKT11SEPT18_20vir01-ali.trf');
D=unique(A,'rows');
B=sortrows(D,16);
%C=B(end:-1:1);
C=flipud(B);
dlmwrite('sorted-mra-SIVKT11SEPT18_20vir01-ali.trf',C,' ');