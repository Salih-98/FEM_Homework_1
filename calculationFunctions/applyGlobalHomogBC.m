function reducedStiffMatrix = applyGlobalHomogBC(GM,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12)
reducedStiffMatrix = GM;

redRow = 0;
if r1 == 0
    reducedStiffMatrix(1,:) =[];
    reducedStiffMatrix(:,1) = [];
    redRow = redRow +1;
end

if r2 == 0
    reducedStiffMatrix(2-redRow, :) = [];
    reducedStiffMatrix (:, 2-redRow) = [];
    redRow = redRow +1;
end

if r3 == 0
    reducedStiffMatrix(3-redRow, :) = [];
    reducedStiffMatrix (:, 3-redRow) = [];
    redRow = redRow +1;
end
if r4 == 0
    reducedStiffMatrix(4-redRow, :) = [];
    reducedStiffMatrix(:, 4-redRow) = [];
    redRow = redRow +1;
end
if r5 == 0
    reducedStiffMatrix(5-redRow, :) = [];
    reducedStiffMatrix (:, 5-redRow) = [];
    redRow = redRow +1;
end
if r6 == 0
    reducedStiffMatrix(6-redRow, :) = [];
    reducedStiffMatrix (:, 6-redRow) = [];
    redRow = redRow +1;

end
if r7 == 0
    reducedStiffMatrix(7-redRow, :) = [];
    reducedStiffMatrix (:, 7-redRow) = [];
    redRow = redRow +1;

end
if r8 == 0
    reducedStiffMatrix(8-redRow, :) = [];
    reducedStiffMatrix (:, 8-redRow) = [];
    redRow = redRow +1;

end
if r9 == 0
    reducedStiffMatrix(9-redRow, :) = [];
    reducedStiffMatrix (:, 9-redRow) = [];
    redRow = redRow +1;

end

if r10 == 0
    reducedStiffMatrix(10-redRow, :) = [];
    reducedStiffMatrix (:, 10-redRow) = [];
    redRow = redRow +1;

end
if r11 == 0
    reducedStiffMatrix(11-redRow, :) = [];
    reducedStiffMatrix (:, 11-redRow) = [];
    redRow = redRow +1;

end
if r12 == 0
    reducedStiffMatrix(12-redRow, :) = [];
    reducedStiffMatrix (:, 12-redRow) = [];
    redRow = redRow +1;
end
end

