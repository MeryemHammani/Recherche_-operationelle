function [T,B,S]=TableauInitial(A,b,c)

[m,n]=size(A);
%base initiale qui contient les indices des variables d'écart 
B=[n+1:m+n];
A=[A  eye(m) zeros(m,1) b ];
%z
c=[c zeros(1,m) -1 0];
%tracage de tableau initial
x=[A;c];
t=array2table(x);
t.Properties.VariableNames(size(x,2)-1:size(x,2))={'z','b'}
%le tableau initial
T=[A ; c];
%la solution initiale
S=sol(B,T);
end