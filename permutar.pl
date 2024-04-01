%--------------------------------------------------
% permuta(Lista, ListaR).
%es cierto cuando ListaR unifica con una lista
%que contiene los elementos de Lista en orden
%distinto. Este predicado genera todas las
%listas posibles por backtraking.
%--------------------------------------------------


permutar([], []).

permutar([Cab|Resto], R2):- permutar(Resto, R), 
  append(L1, L2, R),  append(L1, [Cab|L2], R2).
  
  
permutar2([], []).

permutar2([Cab|Resto], ):-
