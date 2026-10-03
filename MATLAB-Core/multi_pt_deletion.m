% this code deletes the points that are within a circle of radius 10 from a point. So this points gives the reduced data sets
V=dlmread('vir1-pts.txt');
%M=dlmread('POINTS_VIR1_REAL.pos');
M=dlmread('real-points-vir1-bin2.pos');
M=M*2;
counter = 0;
dataMatrix=V;
queryMatrix=M;
x=size(queryMatrix,1);
%=size(dataMatrix,1);
numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
CNT=[];
%CNT_NEW=CNT;
  for i=1:numQueryVectors;
      cnt=0;
    counter = 0;
    dist = sqrt(sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2));
    for j=1:numDataVectors, 
        if (dist(j) > 0 && dist(j) < 16)
            cnt = cnt + 1;            
        end
    end
    CNT=[CNT;cnt];
  end
  CNT
  %CNT_NEW=[];
  CNT_NEW=[CNT_NEW; [CNT']]
  %dlmwrite('multiple_picks_cycle02_vir01.txt',CNT);
  
  
