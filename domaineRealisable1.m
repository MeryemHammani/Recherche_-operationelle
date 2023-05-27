function domaineRealisable1(A, b, c)
%Les contraintes qui ont le 2eme coeff null deviennent les dernieres
for i=1: size(A,1)-1
   if  A(i,2)==0
      for j=i+1: size(A,1)
          if  A(j,2)~=0
              u=A(i,:);
              A(i,:)=A(j,:);
              A(j,:)= u;
              d =b(i);
              b(i)=b(j);
              b(j)=d;
              break;
          end
      end
   end   
end 

%On determine les intersections entre les contraintes
k=1;
for i=1 : size(A,1)-1
    for j=i+1: size(A,1)
        M(1, :)=A(i, :);
        M(2, :)=A(j, :);
        B(1)=b(i);
        B(2)=b(j);
        [inters] =ResoltLU(M ,B);
        X(k)=inters(1);
        Yinter(k)=inters(2);
        k =k+1;
    end
end
%Les intersections avec l'axe des x


for i=1:size(A,1)
    
    if A(i,1)~= 0
        U(i)=b(i)/A(i,1);
    end
end


%On prend les min des intersections avec 

limit= min(U(find (U>0)));
%On prend le max ente le min d'intersection avec x et le max des sommets(x~=0 et y>0)
[~,in]=max(X);
if Yinter(in)>0
   if max(X)> limit
       limit =max(X);
   end
end
%Cas du droite verticale
m=1;
for i=1 : size(A,1)
    if A(i,2)==0
        v(m)=b(i)/A(i,1);
        m=m+1;
    end
end
%S'il existe une droite verticale on prend la valeur de x comme limit de vecteurs x
if m~=1
    if min(v)< limit
        limit =min(v);
    end
end
%tracage des contraintes    
% pour le cas non bornéé limit=10;
x=0:0.01:limit;

for i=1 : size(A,1)
    if A(i,2)~=0
        y(i,:)=(b(i)-x*A(i,1))/A(i,2);
        plot (x, y(i,:),'r');
    else
        plot([b(i)/A(i,1) b(i)/A(i,1)] ,[0 max(max(y))]);        
    end
    hold on;
    %axis([0 limit -5 max(max(y))]);
end

%determination de l'intersection des contraintes qui on A(i,2) negatif et
%A(i,1)negatif
bneg=0;
j=1;
for i=1: size(A,1)
   if A(i,2)<0 && A(i,1)>0
       x0(j)=b(i)/A(i,1);
       j=j+1;
       bneg=1;
   end   
end
%area si la condition n'est pas verifiee
if bneg==0 || min(x0)>=limit
     for i=1 :length(x)       
       yM(i)=min(y(find(y(:,i)>=0),i));    
     end       
area (x, yM);
%si la condition est verifiee
else 
   m0=min(x0);
   ind= find(x==m0);  
    for j=1 :ind;
        y0=y(:,j);
        yM(j)=min(y0(find(y0>=0)));
    end
    area([0:0.01:m0],yM);
    
     
     [~,iM]=min(y(find(y(:,ind+1)>=0),ind+1));
   
     for i=ind :size(y,2)
        [l,indice]=min(y(find(y(:,i)>=0),i));  %%indice de contrainte min 
        if indice == iM
          y(indice,i)=-1;
          fill([x(i),x(i)],[min(y([find(y(:,i)>=0)],i)),l],'blue');
          hold on
        end
    end  
end

c_max= c(1)*limit+c(2)*max(Yinter);

for p=0:1:c_max
   Yobj=(p-c(1)*x)/c(2);
   plot(x,Yobj,'b');  
end
end