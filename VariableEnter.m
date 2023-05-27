function [indexE]=VariableEnter(T)
[m, n ]=size(T);
%z
c=T(m,:);
v=c(1:length(c)-2);
[~,indexE]=max(v);
end 