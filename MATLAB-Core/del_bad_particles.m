% This code gives the indeces of the lines which should be deleted from the
% data-ali.txt file to get the final file.
V=load('final-pts.txt');
%V=dlmread('all-mem-class.pos');
%M=dlmread('POINTS_VIR1_REAL.pos');
M=load('all-pts-35.pos');
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
  dlmwrite('index-del.txt',INDX);
  
  
