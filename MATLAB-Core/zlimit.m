format longE
A=load('points-data-ali-reduced-again.txt');
 nx=size(A,1);
 F=[];
 for i =1:nx
     if((A(i,3)<=104) && (A(i,3)>=-118))
         F=[F;[A(i,1) A(i,2) A(i,3)]];
     end
 end
 size(F)
 dlmwrite('result-data-ali-reduced.txt',F,'delimiter',' ','precision','%.16f');