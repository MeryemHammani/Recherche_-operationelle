function SystemeMaximisation(A,b,c)

fprintf('---->le tableau et la solution initiaux\n')
[T,B,S]=TableauInitial(A,b,c)
[~,bornee]=VariableLeave(T,B);

  while SolOptimale(T)==0 &&  bornee==1
   fprintf('--->le nouveau tableau')
   [T,B]=novTab(T,B);
   [~,bornee]=VariableLeave(T,B);
  end
if bornee==0
    fprintf('cette fonction est non bornee \n')
end

end



