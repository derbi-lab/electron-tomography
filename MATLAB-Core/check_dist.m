% this code counts the number of points that are within a circle of radius 10 from a point. 
%Genertaed points
V=dlmread('vir-18.pos');
%Real points
M=dlmread('vir-19-side.pos');
%if you need to get teh unbinned points ,then uncomment the following line
%M=M*2;
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
        if (dist(j) >=0 && dist(j) <=16)
            cnt = cnt + 1;            
        end
    end
    CNT=[CNT;cnt];
  end
  CNT
  %CNT_NEW=[];
  CNT_NEW=[CNT_NEW; [CNT']]
  dlmwrite('multiple_picks_cycle31_vir18.txt',CNT);
  
  
