V=load('spin-angles-new.txt');
CNT=[];
for i = 1:1198
    
    if((V(i,5)>0)&&(V(i,6)>0)&&(V(i,7)>0))
        cnt=1;
        %break;
    elseif((V(i,5)<0)&&(V(i,6)<0)&&(V(i,7)<0))
        cnt=1;
        %break;
    else
        cnt=0;
    end
    CNT=[CNT;[cnt]];
end
    size(CNT)
    INDX=[];
for i=1:1198
    if(CNT(i)==1)
        INDX=[INDX;i];
    end
end
dlmwrite('bad_indx.txt',INDX);