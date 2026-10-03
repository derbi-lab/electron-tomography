% this code replaces all tabs and changes this to single space
format longE
X = dlmread('output-ellipso.txt');
dlmwrite('fixed-output-ellipso.txt',X,'delimiter',' ','precision',16)