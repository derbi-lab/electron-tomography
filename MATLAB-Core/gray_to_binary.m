I = imread('mask-1-bigger-gray.tif');
J=rgb2gray(I)
imshow(I)
imshow(J)
[X, map] = gray2ind(J, 2);
Y=1-X;
imwrite(X,map,'mask.tif');
imwrite(Y,map,'mask-invert.tif');