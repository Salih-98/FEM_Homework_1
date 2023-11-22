function reducedGlobalMatrix = applyInHomogBC(GlobalStiffnessMatrix, beta)
reducedGlobalMatrix = GlobalStiffnessMatrix;

for i=1:6
    reducedGlobalMatrix(6,i) = GlobalStiffnessMatrix(6,i) * tand(beta)*(-1);
end

for i=1:6
    reducedGlobalMatrix(i,6) = reducedGlobalMatrix(i,6)*tand(beta)*(-1);
end

reducedGlobalMatrix(end-1, :) = reducedGlobalMatrix(end-1, :) + reducedGlobalMatrix(end, :);
reducedGlobalMatrix(end, :) = [];

reducedGlobalMatrix(:,end-1) = reducedGlobalMatrix(:,end-1) + reducedGlobalMatrix(:,end);
reducedGlobalMatrix(:, end) = [];

end

