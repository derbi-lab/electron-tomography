% this code is not used anymore. this is for picking equidistant pints over
% a circle
m=42;
r=61.1844;
t=[0:m-1]'
A=r*cos(2*pi*t/m)
B=r*sin(2*pi*t/m)
plot(r*cos(2*pi*t/m),r*sin(2*t*pi/m),'o')
C=horzcat(A,B)
%D=repmat(0,m,1)
%D=repmat(9.0545,m,1)
%D=repmat(17.9413,m,1)
%D=repmat(26.4957,m,1)
%D=repmat(34.5591,m,1)
%D=repmat(41.9823,m,1)
%D=repmat(48.6276,m,1)
%D=repmat(54.3720,m,1)
%D=repmat(59.1089,m,1)
%D=repmat(62.7507,m,1)
%D=repmat(65.2299,m,1)
%D=repmat(66.5005,m,1)
%D=repmat(-9.0545,m,1)
%D=repmat(-17.9413,m,1)
D=repmat(-26.4957,m,1)
%D=repmat(-34.5591,m,1)
%D=repmat(-41.9823,m,1)
%D=repmat(-48.6276,m,1)
%D=repmat(-54.3720,m,1)
%D=repmat(-59.1089,m,1)
%D=repmat(-62.7507,m,1)
%D=repmat(-65.2299,m,1)
%D=repmat(-66.5005,m,1)
E=horzcat(C,D)
F=[465.15 485.1 120]
G=repmat(F,m,1)
E=E+G
dlmwrite('circle6_new.pts',E,' ')

