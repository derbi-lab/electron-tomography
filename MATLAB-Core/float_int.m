%This script outputs the index of all the duplicated points in an trf file
clear;
%base_name='SIV_040_vir';
%suffix='.pos';
%for i=1:23
%j=num2str(i);
%V=load('strcat(base_name,j,suffix)');
%V=load('GENERATE_POINT_ALL/SIV_040_19.pos');
%V=load('GENERATE_POINT_ALL_bin4/SIV_051_bin4_23.pos');
%points to be removed
V=load('cls-remove-all.pos');
%all points
X=load('points-all.txt');
nx=size(V,1);
%X=floor(V);
%dataMatrix=X;
dataMatrix=V;
queryMatrix=X;
x=size(queryMatrix,1);
%=size(dataMatrix,1);
numDataVectors = size(dataMatrix,1)
numQueryVectors = size(queryMatrix,1)
INDX=[];
% dist=[];
% for i=1:numQueryVectors;
%     dist=[];
% dist =sqrt(sum((repmat(queryMatrix(i,:),numDataVectors,1)-dataMatrix).^2,2));
% dx=size(dist,1);
% for i=1:dx
%     if(dist(i)==0)
%         INDX=[INDX;[i]];
%     end
% end
% end
for i=1:numDataVectors
    %for j=i+1:numDataVectors
     for j=1:numQueryVectors
        %if((X(i,1)==X(j,1))&&(X(i,2)==X(j,2))&&(X(i,3)==X(j,3)))
        if((V(i,1)==X(j,1))&&(V(i,2)==X(j,2))&&(V(i,3)==X(j,3)))
            INDX=[INDX;[j]];
            %INDX=[INDX;[i]];
        end
    end
end
%end
dlmwrite('index-delete.txt',INDX,' ');
            
        
        
        