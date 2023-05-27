function x=sol(B,T)
[m,n]=size(T);
x=zeros(1,n-2);
%remplire les variables de base par b 
for i=1:m-1
   x(B(i))=T(i,n);
end
end 