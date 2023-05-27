function [novT,novB]=novTab(T,B)
[m,n]=size(T);
A=T(1:m-1,:);
c=T(m,:);
%operations sur les lignes
A(VariableLeave(T,B),:)=A(VariableLeave(T,B),:)/A(VariableLeave(T,B),VariableEnter(T));
for i=1:size(A,1)
    if i~=VariableLeave(T,B)
        A(i,:)=A(i,:)-A(VariableLeave(T,B),:)*A(i,VariableEnter(T));
    end
end
c=c-A(VariableLeave(T,B),:)*c(VariableEnter(T));
novT=[A;c];
%tracage de tableau
x=[A;c];
t=array2table(x);
t.Properties.VariableNames(size(x,2)-1:size(x,2))={'z','b'}
%nouvelle base
B(VariableLeave(T,B))=VariableEnter(T);
novB=B;
novB
sol(novB,novT)
fobj=-novT(m,n)
end