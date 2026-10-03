% this code deletes the points that are within a circle of radius 10 from a point. So this points gives the reduced data sets
%V=dlmread('shifted_points.txt');
%change_counter = 0;
V
final_deleted_pts_index = [];
main_data_matrix = V
dataMatrix=V;
size(dataMatrix)
queryMatrix=V;
x=size(queryMatrix,1)
%=size(dataMatrix,1);
final_points=[];
deleted_points = [];
%neighborIds = zeros(size(queryMatrix,1),k);
%neighborDistances = neighborIds;
numDataVectors = size(dataMatrix,1);
numQueryVectors = size(queryMatrix,1);
dist =sqrt(sum((repmat(queryMatrix(1,:),numDataVectors,1)-dataMatrix).^2,2))
old_row_count= size(dist,1)
cnt = 0;
while(numDataVectors>0)
    i=1;
%for i=1:numQueryVectors,
    change_counter = 0;
    dist =sqrt(sum((repmat(queryMatrix(1,:),numDataVectors,1)-dataMatrix).^2,2))
    %sort(dist,'ascend')
    n_dist = size(dist,1);
    for j=1:n_dist,
        cnt = cnt + 1;
        if (dist(j) == 2)
            cnt;            
            j_new=j-change_counter;
            % resize the two matrices and continue
            fprintf('*** Deleted points are ***');
            %dataMatrix(j_new,:)
            %deleted_points = [deleted_points;queryMatrix(1,:)];
            deleted_points = [deleted_points;dataMatrix(j_new,:)]
            f_dataMatrixnew = dataMatrix(1:j_new-1,:);
            s_dataMatrixnew = dataMatrix(j_new+1:numDataVectors,:);
            dataMatrix = vertcat(f_dataMatrixnew,s_dataMatrixnew);
            f_queryMatrixnew = queryMatrix(1:j_new-1,:);
            s_queryMatrixnew = queryMatrix(j_new+1:numDataVectors,:);
            queryMatrix = vertcat(f_queryMatrixnew,s_queryMatrixnew);
            numDataVectors = size(dataMatrix,1);
            numQueryVectors = size(queryMatrix,1);
            change_counter = change_counter+1;
        end
   end
  %i_f_dataMatrixnew=dataMatrix(1:i-1,:);
  %i_s_dataMatrixnew=dataMatrix(i+1:numDataVectors,:);
  %dataMatrix=vertcat(i_f_dataMatrixnew,i_s_dataMatrixnew)
  %fprintf('*** Deleted points are ***');
  %deleted_points
  newdataMatrix=dataMatrix(1,:);
  final_points = [final_points;newdataMatrix];
  dataMatrix=dataMatrix(2:numDataVectors,:);
  %i_f_queryMatrixnew=queryMatrix(1:i-1,:);
  %i_s_queryMatrixnew=queryMatrix(i+1:numQueryVectors,:);
  %queryMatrix=vertcat(i_f_queryMatrixnew,i_s_queryMatrixnew)
  newqueryMatrix=queryMatrix(1,:);
  queryMatrix=queryMatrix(2:numQueryVectors,:);
  numDataVectors = size(dataMatrix,1);
  numQueryVectors = size(queryMatrix,1);
end
deleted_pts_size = size(deleted_points,1);
fprintf('*** Deleted points indices are ***');
for k = 1:deleted_pts_size,
    for l=1:size(main_data_matrix,1),
        vec = isequal(deleted_points(k,:),main_data_matrix(l,:));
        if vec == 1,
            final_deleted_pts_index = [final_deleted_pts_index;l];
        end
    end
end
final_deleted_pts_index
file_1 = fopen('test_indx.txt','w');
for k=1:size(final_deleted_pts_index,1),
    data = final_deleted_pts_index(k,:)
    fprintf(file_1,'%d \n',data)
end
fclose(file_1);
final_points;
m=size(final_points,1)
n=size(final_points,2)
dlmwrite('final_test-points.pos',final_points,' ')