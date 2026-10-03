% this code gives up a file  containing the indeces of those lines for the distance between the lines from the two given files are zero.
%Next continuation is count_same_spike.m
%
%
%varialble file
V=load('bad_class_mem_32.txt');
%fixed file
M=load('bad_class_mem_35.txt');
%M=M*2;
counter = 0;
dataMatrix=V;
queryMatrix=M;
x=size(queryMatrix,1);
%=size(dataMatrix,1);
numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
INDX=[];
%CNT_NEW=CNT;
  for i=1:numQueryVectors;
      %cnt=0;
    %counter = 0;
    dist = sqrt(sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2));
    for j=1:numDataVectors, 
        if (dist(j) == 0)
            INDX=[INDX; i];            
        end
    end
    %CNT=[CNT;cnt];
  end
  %CNT
  %CNT_NEW=[];
  %CNT_NEW=[CNT_NEW; [CNT']]
  dlmwrite('index-32.txt',INDX);
  
  
