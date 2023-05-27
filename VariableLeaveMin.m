function [index,bornee]=VariableLeaveMin(T,B)
[m, n]=size(T);
b=T(1:m-1,n);
x=T(1:m-1,VariableEnterMin(T));
if any(x>0)
      bornee=1;
    for i=1:length(x)
     
        v(i)=b(i)/x(i);
        if x(i)<0
            v(i)=-1;
        end
         
    end
    v(find(v<0))=max(v)+1;
    
    %bland
    m=min(B(find(v==min(v))));
    index=find(B==m);

    
else
    
    bornee=0;
    index=0;
end
end