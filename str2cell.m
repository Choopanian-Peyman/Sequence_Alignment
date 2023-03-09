function c = str2cell(s)
% Convert a string to a cell array of size 1 by N, where N is the
% string length. Each cell contains one character of the string.
c = cell(1,length(s)+1);
c(1) = cellstr(' ');
for i=1:length(s)
    c(i+1) = cellstr([s(i)]);
end
end