function [u,l,det]=factoLU(A)
n=size(A,1);
for k=1:n-1
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
end
   
%%l=ones(n);
u=zeros(n);
l=tril(A);
u=triu(A);
for i=1:n
    l(i,i)=1;
end 
det=1;
for i=1:n
    det=det*u(i,i);
end

end
