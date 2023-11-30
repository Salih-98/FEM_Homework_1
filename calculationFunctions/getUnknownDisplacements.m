function displacements = getUnknownDisplacements(rGM,globalLoadVector, pru23, beta)
syms rc; syms m; syms n

sortedSystemMatrix = rGM;

% We have to reorganize the matrix
% Move the fourth row to the first row
sortedSystemMatrix = [sortedSystemMatrix(4, :); sortedSystemMatrix(1:3, :); sortedSystemMatrix(5, :)];

% Move the fourth column to the first column
sortedSystemMatrix = [sortedSystemMatrix(:, 4), sortedSystemMatrix(:, 1:3), sortedSystemMatrix(:, 5)];

% Move the fourth row to the first place
r = [globalLoadVector(4); globalLoadVector(1:3); globalLoadVector(5)];

%Define the u vector
u = [pru23, m, n];

% Define ur and uu
uu = double(u(1,1));

% Define rr and ru
rr = double(r(2:5,1));

% Define Krr, Kuu, Kur matrices
Kuu = sortedSystemMatrix(1,1);
Krr = sortedSystemMatrix(2:5, 2:5);
Kru = sortedSystemMatrix(2:5,1);
Kur = transpose(Kru);
p = (rr - Kru*uu);
displacements = inv(Krr)*p;
u32 = (-1)*tand(beta)*displacements(4,1);
displacements (5,1) = u32;
% Solve for r
%disp('r is equal to:')
%ru = Kuu*uu + Kur*ur;
end

