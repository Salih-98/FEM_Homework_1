function [c1, c2, c3] = getDirectCos(fn1, fn2, fn3, sn1,sn2,sn3, L)
% This is a function which takes as input arguments x,y,z coordinates of
% the first node, the x,y,z coordinates of the second, and the length
% of the element, and returns as output three directional cosines based on
% the formula defined in the lecture in Linear FEM. 

c1 = round((sn1-fn1)/L,4);
c2 = round((sn2-fn2)/L,4);
c3 = round((sn3-fn3)/L,4);

end

