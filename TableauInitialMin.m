function [T,B,S]=TableauInitialMin(A,b,c)
[m,n]=size(A);
B=[n+1:m+n];
A=[A  eye(m) zeros(m,1) b ];
c=[c zeros(1,m) 1 0];
x=[A;c];
t=array2table(x);
t.Properties.VariableNames(size(x,2)-1:size(x,2))={'z','b'}
T=[A ; c];
S=sol(B,T);
end