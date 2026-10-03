r=10;
system('rbox 200 s D3 > points.txt');
V=dlmread('points.txt');
V=V*r;
V = round(V)
