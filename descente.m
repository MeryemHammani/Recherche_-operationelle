function [x]= descente(A,b)
n=length(b);
x(1)=b(1);
for i=2:n
    s=0;
  for j=1:i-1
    s=s+A(i,j)*x(j);
  end  
    x(i)=b(i)-s;
end
end

