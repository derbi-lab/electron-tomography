V1=load('spin-43.txt');
V2=load('spin-44.txt');
V3=load('spin-45.txt');
V4=load('spin-46.txt');
V5=load('spin-47.txt');
%V7=load('spin-42-new.txt');
%V=horzcat(V1,V2,V3,V4,V5,V6,V7);
V=horzcat(V1,V2,V3,V4,V5);
dlmwrite('spin-angles.txt',V,' ');
