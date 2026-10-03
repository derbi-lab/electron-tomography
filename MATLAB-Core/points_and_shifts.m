% this code adds shifts of each points after alignment with the origianl
% points positions 
format longE
V1=dlmread('class-points');
V2=dlmread('shifts-points');
V3=V1+V2;
dlmwrite('new-points.txt',V3,'delimiter',' ','precision',15);