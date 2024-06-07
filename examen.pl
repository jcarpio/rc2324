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

reverse(+Lista, -R)

*/

reverse([], []).
reverse(Lista, R):- append([L1, [E]], Lista), reverse(L1, L1R), 
   append([E], L1R, R).   

/*

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



/*

lista_hojas(+ArbolGenerico, -R )
  es cierto si R unifica con una lista que contiene
  las hojas de ArbolGenerico.

*/

lista_hojas(a(Et, []), [Et]).
lista_hojas(a(_, ListaHijos), R):- ListaHijos \= [], lista_hojas(ListaHijos, R).

lista_hojas([], []).
lista_hojas([Cab|Resto], R):-  lista_hojas(Resto, RResto), lista_hojas(Cab, RCa),
  append([RCa, RResto], R).
  
arbol_1(  a(1, [a(2, [a(3,[]), a(4,[]), a(5,[])]), a(6, []), a(7, [a(8,[]), a(9,[])])])  ).   

/*

balanceado(+ArbolBinario)
  es cierto si Arbolbinario es balanceado. Un árbol es balanceado
  si para cada nodo del árobol, la diferencia entre la altura
  del Hijo Izquierda y el Hijo Derecha es como máximo 1 en valor
  absoluto.

*/

balanceado(a(_, HI, HD),  ):-
  altura(HI, AI),
  altura(HD, AD),
  X is abs(AI - AD), X =< 1,
  balanceado(HI),
  balanceado(HD).
  
altura(nil, 0).
altura(a(_, HI, HD), R):- altura(HI, AI), altura(HD, AD), A is max(AI, AD), R is A + 1.
  

/*

anchura(+ArbolBinario, -R) 
  es cierto si R unifica con una lista con las etiquetas 
  de ArbolBinario recorridas en anchura.  

*/
