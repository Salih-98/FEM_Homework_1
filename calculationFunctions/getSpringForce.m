function springForceVector = getSpringForce(displacements, cs1, cs2, cs3, ks)

u = [displacements(3,1); displacements(4,1); displacements(5,1)];
T = [cs3 0 0; 0 cs1 cs2];
uLocal = T * u;
springForceVector = ks * uLocal(2,1);
end

