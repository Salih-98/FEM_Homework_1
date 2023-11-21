%% Linear FEM - Homework 1 - Task 2
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

% Define geometry parameters a, b, c, d, area A, angles alpha and beta
a = 6 + (X+Y)/10;
b = 3 + (Y+Z)/10;
c = 3 + (W+X)/10;
d = 1 + (W + Z)/10;

A = 0.0270;
alpha = atand(c/a);
beta  = atand(d/b);

% Material properties 
E = 200000;

% Loading values
pmax = 2 + (2*W + Y)/10;
prF = 1 + (X+Z)/10;
pru23 = -(1+W/5) * 10^(-3);

% Spring stiffness
ks = 150 + 3*Y;

%% Defining the geometry of the structure
% In this section we define coordinates of each node in the global
% coordinate system - based on the figures given in the task formulation.

% Node 1
x1 =b; y1=-d; z1=a;
% Node 2
x2 =b+c; y2=-d; z2=0;
% Node 3
x3 =b; y3=-(d+b); z3=0;
% Node 4
x4 =0; y4 =0; z4=0;

%% Defining the length and stiffness of each element

% Element 1
L1 = round(sqrt(b^2 + d^2 + a^2),4); stiff1 = getStiffness(E,A,L1);
% Element 2
L2 = round(sqrt(c^2 + a^2),4); stiff2 = getStiffness(E,A,L2);
% Element 3
L3 = round(sqrt(a^2 + b^2),4); stiff3 = getStiffness(E,A,L3);
% Spring
Lspring = round(sqrt(c^2 + b^2),4);

%% Calculate directional cosines for each element

[c11, c12, c13] = getDirectCos(x4,y4,z4, x1,y1,z1,L1);
[c21, c22, c23] = getDirectCos(x2,y2,z2, x1,y1,z1,L2);
[c31, c32, c33] = getDirectCos(x3,y3,z3, x1,y1,z1,L3);
[cs1, cs2, cs3] = getDirectCos(x2,y2,z2, x3,y3,z3,Lspring);

%% Calculate element stiffness matrix for each elements (BCs not applied)

[k1, smm1] = getElementStiffnessMatrix(stiff1, c11,c12,c13);
[k2, smm2] = getElementStiffnessMatrix(stiff2, c21,c22,c23);
[k3, smm3] = getElementStiffnessMatrix(stiff3, c31,c32,c33);
[kSpring, smms] = getElementStiffnessMatrix(ks, cs1, cs2, cs3);

%% Apply boundary conditions 

disp('Reduced matrix for element 1 is:')
[kr1,rsmm1] = applyHomogBC(k1, smm1, 0,0,0,1,1,1)
disp('Reduced matrix for element 2 is:')
[kr2, rsmm2] = applyHomogBC(k2, smm2, 0,0,1,1,1,1)
disp('Reduced matrix for element 3 is:')
[kr3, rsmm3] = applyHomogBC(k3, smm3, 1,1,0,1,1,1)
disp('Reduced matrix for the spring is:')
[ksr,rsmms] = applyHomogBC(kSpring, smms, 0,0,1,1,1,0)

%% Custom functions

function stiffness = getStiffness(E,A,L)
stiffness = E*A/L;
end
