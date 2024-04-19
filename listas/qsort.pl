:- set_prolog_stack(global, limit(16 000 000 000)).
:- set_prolog_stack(trail,  limit(16 000 000 000)).
:- set_prolog_stack(local,  limit(16 000 000 000)).


/*

qsort(+Lista, -R)
  es cierto si R unifica con una lista que contiene
  los elementos de Lista ordenados de menor a mayor.
 
*/

qsort([], []).
qsort([Pivote|Resto], R):-
   divide(Pivote, Resto, Me, Ma),
   qsort(Me, RMe), 
   qsort(Ma, RMa), 
   append(RMe, [Pivote|RMa], R).

/*

divide(+Pivote, +Lista, -Menores, -Mayores)
  es cierto si Menores unifica con una lista que 
  contiene los elementos de Lista que son menores
  o iguales que el Pivote y Mayores unifica
  con una lista que contiene los elementos de 
  Lista que son Mayores que el Pivote.

*/

divide(_, [], [], []).

divide(Pivote, [Cab|Resto], [Cab|RMe], RMa):- Cab =< Pivote,
  divide(Pivote, Resto, RMe, RMa).
  
divide(Pivote, [Cab|Resto], RMe, [Cab|RMa]):- Cab > Pivote,
  divide(Pivote, Resto, RMe, RMa).  
