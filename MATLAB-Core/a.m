colors = distinguishable_colors(20);
n = 20;
angles = linspace(0,2*pi,n);
h = zeros(n,1);
for ii = 1:n
   h(ii) = ellipse(2,1,angles(ii),0,0,colors(ii,:));
end
axis equal
axis off
set(h,'linewidth',2)
set(gcf,'color','w')