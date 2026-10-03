I = imread('mask-1-bigger-middle-flatten.tif');
J=rgb2gray(I);
[X, map] = gray2ind(J, 2);
Y=1-X;
%imshow(Y,map);
imwrite(X,map,'mask-bigger.tif');
imwrite(Y,map,'mask-bigger-invert.tif');