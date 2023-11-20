function [W,X,Y,Z] = getWXYZ(iNum)
i = length(iNum);
Z = str2num(iNum(i)); 
Y = str2num(iNum(i-1));
X = str2num(iNum(i-2));
W = str2num(iNum(i-3));
end

