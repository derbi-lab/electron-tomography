%function check_radius(X)
X= dlmread('points+shifts_vir1.txt');
radius=[];
n=size(X,1);
d=size(X,2);
Y=[91.434575 129.234575 0];
Z=repmat(Y,n,1);
V=X-Z;
for i=1:n
        dist=sqrt(sum(V(i,:).^2,2));
        radius=[radius; dist];
end  
radius
    avarage_radius = sum(radius);
fprintf('\naverage radius is %d\n ',avarage_radius/n);
