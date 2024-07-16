/*
 Ordenaciones:
 
 Inserción
 Burbuja
 QuickSort
 
QuickSort:

 quicksort(+Lista, -R)
   es cierto si R unifica con una lista
   que contiene los elementos de Lista
   ordenados de menor a mayor.
   
 men_may(+Piv, +Lista, -Men, May)
   es cierto si Men unifica con los
   elementos de Lista menores o iguales
   que Piv y May unifica con una lista
   con los elementos de Lista mayores
   que Piv.
   
   Principio de inducción:
   1) P(n0)
   2) P(n-1) -> p(n)

       5
9 1 8 4 7 2 6 3 5

Menores     Mayores
1,4,2,3,   9,8,7,6
  |             |
quicksort  quicksort
  |             |
1,2,3,4, [5]  6,7,8,9

Conseguir el mejor pivote tiene
coste O(n)

O(1)

O(nLogn) 27 seg
O(n^2)   37.000 años

10^12^2 = 10^24 
m1 = 2.6 TFlogs    2.6 x 10^12
i7 960 = 51 GFlops 51 x 10^9

*/
quicksort([], []).
quicksort([P|Resto], R):-
    men_may(P, Resto, RMe, RMa),
    quicksort(RMe, RMeOrd),
    quicksort(RMa, RMaOrd),
    append(RMeOrd, [P|RMaOrd], R). 

men_may(_, [], [], []).

men_may(Piv, [Cab|Resto], [Cab|RMe], RMa):-
    Cab =< Piv,
    men_may(Piv, Resto, RMe, RMa).

men_may(Piv, [Cab|Resto], RMe, [Cab|RMa]):-
    Cab > Piv,
    men_may(Piv, Resto, RMe, RMa).
