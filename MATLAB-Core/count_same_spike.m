%this script calculates whether the same bad particle belong to the bad
%looking classes for different cycles . The preeciding code is check_occurance.m
clear;
% control cycle
V1=load('index-35.txt');
basename='index-';
b_name='count-spike-';
suffix='.txt';
% cycle numbers
a=[32,33,34];
n=size(a,2);
CNT_global=[];
for k=1:n
    l=num2str(a(k));
%V2=load('index-26.txt');
V2=load(strcat(basename,l,suffix));
n1=size(V1,1);
n2=size(V2,1);
CNT=[];
for i = 1:n1
    for j = 1:n2
       if(V1(i)==V2(j))
         cnt=1;
         break;
       else
         cnt=0;
       end
    end
    CNT=[CNT;[cnt]];
end
dlmwrite(strcat(b_name,l,suffix),CNT);
CNT_global=horzcat(CNT_global,CNT);
%dlmwrite('count-spike.txt',CNT);
end
%write the 0/1 matrix showing occurance of the same bad particle in
%consecutive cycles
dlmwrite('particle.txt',CNT_global,' ');
SUM=(sum(CNT_global'))';
% write the sum(row sum) of the occurance of the same bad particles
dlmwrite('occurance.txt',SUM);
%write the index of the particles those are needed to be deleted
% set tolerance level t
t=3;
INDX=[];
for i=1:n1
    if(SUM(i)>=t)
        INDX=[INDX;i];
    end
end
dlmwrite('del_indx.txt',INDX);

