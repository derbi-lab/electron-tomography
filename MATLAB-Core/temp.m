M=load('sph000_vir01_points.txt');
N=load('sph000_vir01_shifts.txt');
P=horzcat(M,N);
Q=load('col8to16_vir01.txt');
P=horzcat(P,Q);
dlmwrite('recalculated_data_vir01_new.txt',P,' ');
