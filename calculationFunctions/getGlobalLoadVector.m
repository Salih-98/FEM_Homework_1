function globalLoadVector = getGlobalLoadVector(localLoadVector, C1, C2, C3)

T = [C1 C2 C3 0 0 0; 0 0 0 C1 C2 C3];
Tt = transpose(T);

globalLoadVector = Tt * localLoadVector;

end

