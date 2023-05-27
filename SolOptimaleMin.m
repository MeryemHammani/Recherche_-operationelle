function [b]=SolOptimaleMin(T)
[m, n ]=size(T);
c=T(m,:);
v=c(1:length(c)-2);
if any(v<0)
    fprintf('the solution is not optimal\n')
    b=0;
else
    fprintf('the solution is optimal\n')
    b=1;
end