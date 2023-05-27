function [indexE]=VariableEnterMin(T)
[m, n]=size(T);
c=T(m,:);
v=c(1:length(c)-2);
[~,indexE]=min(v);
end