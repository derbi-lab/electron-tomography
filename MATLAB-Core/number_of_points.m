% this gives average number of points along each circle %
% diamerter of the spike head
D=9.0826;
%d=D/2;
%radius of the virion
R=66.6750
%no of cicles in one hemisphere
S=(pi*R)/2
N=round(S/D)
% no of points in the circle in the equator
n=round(2*pi*R/D)
%the angle in the centre of the sphere to the point on the perimeter along
%the z-axix
theta=(D/R)
%radius of the first circle
R1=R*(cos(theta))
Z1=R*sin(theta)
% no of points in the first circle
n1=round((2*pi*R1)/D)
% calculation for the second circle
theta1=(2*D/R)
R2=R*(cos(theta1))
Z2=R*sin(theta1)
n2=round((2*pi*R2)/D)
% calculation for the third circle
theta2=3*D/R
R3=R*(cos(theta2))
Z3=R*sin(theta2)
n3=round((2*pi*R3)/D)
%calculation of the fourth circle
theta3=4*D/R
R4=R*(cos(theta3))
Z4=R*sin(theta3)
n4=round((2*pi*R4)/D)
%calculation for fifth circle
theta4=5*D/R
R5=R*(cos(theta4))
Z5=R*sin(theta4)
n5=round((2*pi*R5)/D)
%calculation for the sixth circle
theta5=6*D/R
R6=R*(cos(theta5))
Z6=R*sin(theta5)
n6=round((2*pi*R6)/D)
%calculation for the seventh circle
theta6=7*D/R
R7=R*(cos(theta6))
Z7=R*sin(theta6)
n7=round((2*pi*R7)/D)
%calculation for the eighth circle
theta7=8*D/R
R8=R*(cos(theta7))
Z8=R*sin(theta7)
n8=round((2*pi*R8)/D)
%calculation for the nineth circle
theta8=9*D/R
R9=R*(cos(theta8))
Z9=R*sin(theta8)
n9=round((2*pi*R9)/D)
%calculation for the tenth circle
theta9=10*D/R
R10=R*(cos(theta9))
Z10=R*sin(theta9)
n10=round((2*pi*R10)/D)
%calculation for the eleventh circle
theta10=11*D/R
R11=R*(cos(theta10))
Z11=R*sin(theta10)
n11=round((2*pi*R11)/D)
%calculation for the twelfth circle
theta11=12*D/R
R12=R*(cos(theta11))
Z12=R*sin(theta11)
n12=round((2*pi*R12)/D)




