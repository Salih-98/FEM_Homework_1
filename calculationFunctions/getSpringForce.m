function [springForceVector, resultantForce] = getSpringForce(ksr, displacements,pru23)

u = [pru23; displacements(4,1); displacements(5,1)];
springForceVector = ksr * u;
resultantForce = sqrt(springForceVector(1,1)^2 + springForceVector(2,1)^2 + springForceVector(3,1)^2);
end

