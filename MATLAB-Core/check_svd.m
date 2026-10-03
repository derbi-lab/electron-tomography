%read the rotation matrix for all the file
format longE
V=load('rotation-raw.txt');
nx=size(V,1)
ny=size(V,2)
I=eye(3)
%check the condition
for i=1:nx
    R=[V(i,1) V(i,2) V(i,3); V(i,4) V(i,5) V(i,6); V(i,7) V(i,8) V(i,9)];
    R*R'
    if(R*R' == I)
        fprintf('correct')
    else
        fprintf('not correct')
    end
end    