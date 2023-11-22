function reducedGlobalLoadVector = getReducedGlobalLoadVector(unrGlLoadVector,force,angle)

reducedGlobalLoadVector = unrGlLoadVector;
for i=4:6
reducedGlobalLoadVector(i,1) = 0;
end
reducedGlobalLoadVector(1,1) = reducedGlobalLoadVector(1,1) + force*cosd(angle);
reducedGlobalLoadVector(2,1) = reducedGlobalLoadVector(2,1) - force*sind(angle);

end

