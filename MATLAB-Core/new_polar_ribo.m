% this code calculated the cross product of two vectors
V=load('membrabe+ribo.pos');
nx=size(V,1)
ny=size(V,2)
cp_mat = [];
for i=1:nx
    dist=[];
    dist=sqrt(sum((repmat(V(i,:),nx,1)-V).^2,2));
    size(dist);
    %dist=[dist;[dist]];
    [sort_val sort_pos]=sort(dist,'ascend');
    n_id=sort_pos(1:3);
    n_n=[];
    n_n=[n_n;[V(n_id(1),:)]];
    n_n=[n_n;[V(n_id(2),:)]];
    n_n=[n_n;[V(n_id(3),:)]];
    n_n
   % find vector1 
    %r1=sqrt(((n_n(2,1)-n_n(1,1)).^2)+((n_n(2,2)-n_n(1,2)).^2)+((n_n(2,3)-n_n(1,3)).^2));
    u_vec1=[];
    u_vec1=[u_vec1; (n_n(2,1)-n_n(1,1)) (n_n(2,2)-n_n(1,2)) (n_n(2,3)-n_n(1,3))]
   % find vector2     
    %r2=sqrt(((n_n(3,1)-n_n(1,1)).^2)+((n_n(3,2)-n_n(1,2)).^2)+((n_n(3,3)-n_n(1,3)).^2));
    u_vec2=[];
    u_vec2=[u_vec2; (n_n(3,1)-n_n(1,1)) (n_n(3,2)-n_n(1,2)) (n_n(3,3)-n_n(1,3))]
    cross_prod=cross(u_vec1,u_vec2);
    cp_mat = [cp_mat;cross_prod];
end
cp_mat;
dlmwrite('cross_product_matrix_test.txt',cp_mat,' ');
Y=horzcat(V,cp_mat);
dlmwrite('cross_product_matrix_horzcat_test.txt',Y,' ');