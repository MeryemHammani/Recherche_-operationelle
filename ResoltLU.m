
function [x]=ResoltLU(A,b)
tic;
[u,l]=factoLU(A);
y=descente(l,b);
x=remontee(u,y);
t=toc;
end






