% This script is for calcualting the distance of each point from the center
% of the spherical shaped virion and idendify the point by returning the
% index if the point has moved significantly inward

% Give te center of the virion
X=[147.94 495.91 108];
% Give te coordinates of the points
V=load('vir-3.pos');
% Compute te distance
nx=size(V,1);
Y=repmat(X,nx,1);
dist = sqrt(sum(V-Y).^2);