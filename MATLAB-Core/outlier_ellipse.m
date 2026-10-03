%This script outputs the index of all the duplicated points in an trf file
clear;
%base_name='SIV_040_vir';
%suffix='.pos';
%for i=1:23
%j=num2str(i);
%V=load('strcat(base_name,j,suffix)');
%V=load('GENERATE_POINT_ALL/SIV_040_19.pos');
V=load('vir-01.pos');
nx=size(V,1);
X=[-187.94 -340.423 7];
%R=53.156;
a=59.985;
b=53.313;
dataMatrix=V;
queryMatrix=X;
x=size(queryMatrix,1);
%=size(dataMatrix,1);
numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
INDX=[];
 dist=[];
 %for i=1:numDataVectors;
    %dist=[];
dist =sqrt(sum((repmat(queryMatrix(1,:),numDataVectors,1)-dataMatrix).^2,2));
% dx=size(dist,1);
% for i=1:dx
%     if(dist(i)==0)
%         INDX=[INDX;[i]];
%     end
% end
% end
% The virus radius
for i=1:numDataVectors
    %if((dist(i)>=R+20)||(dist(i)<=R-20))
    if((dist(i)<=a-15)||(dist(i)<=b-15))
            INDX=[INDX;[i]];
    end
end
dlmwrite('outlier-indx-inward-1.txt',INDX)
%end