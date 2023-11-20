%% Linear FEM - Homework 1 - Task 1
% --- Author: Salih Sahbegovic
% --- Date: 20.11.2023.
% --- Subject: Finite Element Methods in Linear Structural Mechanics
% --- Semester: Winter Semester 2023/2024

%% Defining data given in the task formulation 

addpath('calculationFunctions\')
% In this section we first define W, X, Y, Z based on inputed
% immatriculation number, and then based on that value we define rest of
% given parameters a,b, c,d, A, E, pmax, prescribed values of F and u23, as
% well as spring stiffness 

% -- TODO: This is really rigid coding, just in order to perform
% calculations. Add more flexibility to the code later. 

% Extract W, X, Y, Z from the immatrikulation number
% TODO: Make it so the user can input it during execution, later.
iNum = '108022249956';
[W, X, Y, Z] = getWXYZ(iNum);

syms r; syms m; syms n

% Apply in-homogenous DIRICHLET BC
l = W + X + Z + Y;

% Define the system matrix 
A = [1 2+Z -7; 2+Z -(1+X) 5; -7 5 (1+W)];

%Define the u vector
u = [l, m, n]
% Define ur and uu
uu = double(u(1,1));

% Define the r vector
r = [r; 3+Y; 0.0000];
% Define rr and ru
rr = double(r(2:3,1)); 

% Define Krr, Kuu, Kur matrices
Kuu = A(1,1);
Krr = A(2:3, 2:3);
Kru = A(2:3,1);
Kur = transpose(Kru);

% Solve for m and n
disp('Solutions of the system of equations is:')
displResult = inv(Krr)*(rr - Kru*uu);
disp('m = ')
disp (displResult(1));
disp('n = ')
disp(displResult(2));

% Assign values to the result 
ur=displResult;

% Solve for r
disp('r is equal to:')
ru = Kuu*uu + Kur*ur

