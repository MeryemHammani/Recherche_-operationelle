function [novT,novB]=novTabMin(T,S,B)

[m,n]=size(T);
A=T(1:m-1,:);
c=T(m,:);
%operations sur les lignes
A(VariableLeaveMin(T,B),:)=A(VariableLeaveMin(T,B),:)/A(VariableLeaveMin(T,B),VariableEnterMin(T));
for i=1:size(A,1)
    if i~=VariableLeaveMin(T,B)
        A(i,:)=A(i,:)-A(VariableLeaveMin(T,B),:)*A(i,VariableEnterMin(T));
    end
end
c=c-A(VariableLeaveMin(T,B),:)*c(VariableEnterMin(T));
novT=[A;c];
%tracage de tableau
x=[A;c];
t=array2table(x);
t.Properties.VariableNames(size(x,2)-1:size(x,2))={'z','b'}
%nouvelle base
B(VariableLeaveMin(T,B))=VariableEnterMin(T);
novB=B;
novB
sol(novB,novT)
fobj=-novT(m,n)
end

