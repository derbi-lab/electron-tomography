X=load('d1g1t15.pos');
Y=X(1:1800,:);
%Z=unique(Y,'rows');
dlmwrite('d1g1t15_1800.pos',Y,' ');