function springForceVector = getSpringForce(displacements, cs1, cs2, ks)

u = [displacements(4,1); displacements(5,1)];
Tt = [-cs1 cs1; -cs2, cs2];
uLocal = Tt * u;
springForceVector = ks * uLocal(2,1);
end

