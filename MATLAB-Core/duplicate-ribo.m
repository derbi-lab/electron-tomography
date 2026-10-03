% this code deletes the points that are within a circle of radius 10 from a point. So this points gives the reduced data sets
V=dlmread('new-points.txt');
M=dlmread('new-points.txt');
counter = 0;
%dataMatrix=V;
%queryMatrix=M;
%x=size(queryMatrix,1);
%=size(dataMatrix,1);
n = size(V,1);
m = size(M,1);
CNT=[];
  for i=1:m;
      cnt=0;
    counter = 0;
    dist = abs(sqrt(sum((repmat(M(i,:),n,1)-V).^2,2)));
    for j=1:n 
        if ((dist(j)<5)&&(dist(j)>=1))
            cnt = cnt + 1;            
        end
    end
    CNT=[CNT;cnt];
  end
  CNT;
  dlmwrite('multiple_picks_cycle04_ribo.txt',CNT);
  
  
