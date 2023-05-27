function SystemeMinimisation(A,b,c)

fprintf('--->le tableau et la solution initiaux\n')
[T,B,S]=TableauInitialMin(A,b,c)
[~,bornee]=VariableLeaveMin(T,B);
  while SolOptimaleMin(T)==0 &&  bornee==1
   fprintf('--->le nouveau tableau');
   [T,B]=novTabMin(T,S,B);
   [~,bornee]=VariableLeaveMin(T,B);
   
  end
if bornee==0
    fprintf('cette fonction est non bornee \n')
end

end