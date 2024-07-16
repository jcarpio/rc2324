/*
 Ordenaciones:
 
 Inserción
 Burbuja
 QuickSort
 
Ordenación por burbuja:

 ord_burbuja(+Lista, -R)
   es cierto si R unifica con una lista
   que contiene los elementos de Lista
   ordenados de menor a mayor.
  
ordenada(+Lista)
  es cierto si los elementos de lista están
  ordenados de menor a mayor.
  
   Principio de inducción:
   1) P(n0)
   2) P(n-1) -> p(n)

*/

ordenada([]).
ordenada([_]).
ordenada([Cab1,Cab2|Resto]):-
    Cab1 =< Cab2,
    ordenada([Cab2|Resto]).

burbuja(Lista, Lista):- ordenada(Lista).
burbuja(Lista, R2):-
    append(L1, [E1,E2|Resto], Lista),
    E1 > E2,
    append(L1, [E2,E1|Resto], R),
    burbuja(R, R2).
