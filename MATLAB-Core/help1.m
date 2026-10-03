CNT=[];
cnt=0;
for i = 1:1198
    cnt=cnt+1;
    CNT=[CNT;[cnt]];
end
CNT;
V=load('spin-37.txt');
V1=horzcat(CNT,V);
dlmwrite('spin-file-37.txt',V1,' ')