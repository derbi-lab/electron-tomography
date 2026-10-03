A=[1 1 1; 2 2 2; 9 0 8; 8 7 6; 0 0 1; 9 9 9]
B=[1 1 1; 2 2 2; 9 9 9]
nx=size(A,1);
mx=size(B,1);
ptmat=[];
for i=1:nx
    %ptmat=[];
    for j=1:mx
        if((A(i,1)==B(j,1))&&(A(i,2)==B(j,2))&&(A(i,3)==B(j,3)))
            i=i+1;
            break;
        else
            ptmat=[ptmat;[A(i,:)]];
        end   
    end
    
end
ptmat
size(ptmat)
            
            