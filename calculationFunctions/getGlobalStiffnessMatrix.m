function [GM] = getGlobalStiffnessMatrix(nrESM, nn1, nn2)

GM = zeros(12,12);
clc
%nrESM = k1;
%nn1 = 4;
%nn2 = 1;



%% Homogenous elements

% Starting point for writing of elements corresponding to node 1
sp1 = 3*(nn1-1)+1;
p=1;
for i=sp1:(sp1+2)
k=1;
    for j=sp1:(sp1+2)
        GM(i,j) = nrESM(p,k);
        k = k+1;
        end
p=p+1;
end

sp2 = 3*(nn2-1)+1;
p=4;
for i=sp2:(sp2+2)
k=4;
    for j=sp2:(sp2+2)
        GM(i,j) = nrESM(p,k);
        k = k+1;
    end
p=p+1;
end

%% Inhomogoneous elements
sp11=3*nn1-2;
sp12=3*(nn2-1)+1;

p=1;
for i=sp11:(sp11+2)
k=4;
    for j=sp12:(sp12+2)
        GM(i,j) = nrESM(p,k);
        k = k+1;
    end
p=p+1;
end


sp21=3*nn2-2;
sp22=3*(nn1-1)+1;
p=4;
for i=sp21:(sp21+2)
k=1;
    for j=sp22:(sp22+2)
        GM(i,j) = nrESM(p,k);
        k = k+1;
    end
p=p+1;
end
end



