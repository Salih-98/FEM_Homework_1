function loadVector = getLocalLoadVector(pmax, L)

%-- This function calculates local load vector. Ideally, it should take
% more inputs to be flexible, but at this point we are just performing
% calculations. 
syms x

shapeFunction = [(1-x)*1/2 1/2*(1+x)];
J = L/2;
p1 = (1+x)*pmax/2;
p2 = (1-x)*pmax/2;

% Define the integral expression for the first integral
integralExpression1 = int(transpose(shapeFunction)*p1*J, x);

% Specify the limits of integration for the first integral
lowerLimit1 = -1;
upperLimit1 = -1/3;

% Evaluate the definite integral for the first integral
result1 = double(subs(integralExpression1, x, upperLimit1)) - double(subs(integralExpression1, x, lowerLimit1));

% Define the integral expression for the second integral
integralExpression2 = int(transpose(shapeFunction)*p2*J, x);

% Specify the limits of integration for the first integral
lowerLimit2 = 1/3;
upperLimit2 = 1;

% Evaluate the definite integral for the first integral
result2 = double(subs(integralExpression2, x, upperLimit2)) - double(subs(integralExpression2, x, lowerLimit2));

loadVector = result1 + result2;
end

