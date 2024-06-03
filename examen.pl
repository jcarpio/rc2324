/*

Examen:

Listas:

1. Reverse
2. Mas Veces
3. Elimina cada N
4. Comprime

Árboles

4. Lista Hojas (binario/generico)
5. Balanceado
6. Anchura (binario/generico)

Grafos

7. Ciclios
8. Camino

Problemas Estado

9. Jarras


CLP

10. Sudoku
11. Planificador de horarios


Eimina cada N

elimina_n(+Lista, +N, -R)
  es cierto si R unifica con una lista que contine
  los elementos de Lista eliminando los que ocupan
  posiciones múltiplos de N
  
  ? elimina_n([1,2,3,4,5,6,7,8,9], 3, R).
  R = [1,2,4,5,7,8]

*/

elimina_n(Lista, N, Lista):-  length(Lista, L), L < N.

elimina_n(Lista, N, R2):-  N2 is N-1, length(L1, N2), 
   append(L1, [_|L2], Lista),
   elimina_n(L2, N, R), append(L1, R, R2).
   
   

/*

mas_veces(+Lista, -Elem, -N)
  es cierto si Elem unifica con el elemento de Lista que
  más se repite y N es es el número de veces que se repite.

*/   



comprime([], []).

comprime([E], [(E,1)]).

comprime([Cab, Cab|Resto], [(Cab, N2)|R] ):- 
  comprime([Cab|Resto], [(Cab,N)|R]), N2 is N + 1.

comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2, comprime([Cab2|Resto], R).  



mas_veces(Lista, E, N):- msort(Lista, ListaOrd), comprime(ListaOrd, R), 
   mayor(R, E, N).

   
mayor([], _, 0).   

mayor([(E,N)|R], E, N):-  mayor(R, _, N2), N >= N2.
   
mayor([(_,N)|R], E2, N2):-  mayor(R, E2, N2), N < N2. 
