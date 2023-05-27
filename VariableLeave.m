function [index,bornee]=VariableLeave(T,B)
[m, n ]=size(T);
b=T(1:m-1,n);
%colonne pivot
x=T(1:m-1,VariableEnter(T));
%on teste le colonne pivot  contient positif on continue 
if any(x>0)
    bornee=1;
    for i=1:length(x)
         v(i)=b(i)/x(i);
%les elements negatives on les prend pas en consideration 
         if x(i)<0
            v(i)=-1;
         end
     end
    v(find(v<0))=max(v)+1;
%bland
m=min(B(find(v==min(v))));
index=find(B==m);

else
    index=0;
    bornee=0;
end
end