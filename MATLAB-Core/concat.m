%This code concatenates the position matrix and rottaion matrix 
M = dlmread('shifted_pts_ali_vir19.txt');
N = dlmread('rotation_vir19.txt');
P = horzcat(M,N);
dlmwrite('result-concat-vir19.txt',P,'delimiter',' ','precision',16);