function [elementStiffnessMatrix,SM] = getElementStiffnessMatrix(stiffness,C1, C2, C3)
%GETELEMENTSTIFFNESSMATRIX Generates element stiffness matrix for given
%direction cosines 

syms c1; syms c2; syms c3

% Generates a symbolic matrix which will contain labels for direction
% cosines - useful for following the accuracy of the results
sT = [c1, c2, c3, 0, 0 ,0; 0, 0, 0, c1, c2, c3];
sK = [1, -1; -1, 1];
sTt = transpose(sT); 
SM = sTt * sK * sT;

%Generates a matrix with real values. At this point, no boundary conditions
%are taken into consideration. 
c1 = C1; c2 = C2; c3 = C3;
T = [c1, c2, c3, 0, 0 ,0; 0, 0, 0, c1, c2, c3];
K = [1, -1; -1, 1];
Tt = transpose(T); 
elementStiffnessMatrix = stiffness*round((Tt*K*T),4);
end

