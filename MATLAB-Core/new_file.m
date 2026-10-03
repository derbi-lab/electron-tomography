A=dlmread('multiple_picks_vir01.txt');
B=dlmread('multiple_picks_cycle01_vir01.txt');
C=horzcat(A,B);
D=dlmread('multiple_picks_cycle02_vir01.txt');
E=horzcat(C,D)