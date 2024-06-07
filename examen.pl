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

balanceado(nil).
balanceado(a(_, HI, HD)):-
  altura(HI, AI),
  altura(HD, AD),
  Dif is abs(AI - AD), Dif =< 1,
  balanceado(HI),
  balanceado(HD).
  
altura(nil, 0).
altura(a(_, HI, HD), R):- altura(HI, AI), altura(HD, AD), A is max(AI, AD), R is A + 1.
  
arbol_2( a(1, a(2, a(3, a(6, nil, nil), nil), nil), a(4, nil, a(5, nil, a(7, nil, nil)))) ).
  
arbol_3( a(1, a(2, a(3, nil, nil), nil), a(4, nil, a(5, nil, nil))) ).  
  
/*

anchura(+ArbolBinario, -R) 
  es cierto si R unifica con una lista con las etiquetas 
  de ArbolBinario recorridas en anchura.  

*/

anchura(AB, R):- bin2gen(AB, AG), anchura(AG, R).

anchura(a(Et, ListaHijos), [Et|R]):- anchura(ListaHijos, R).

anchura([], []).
anchura([a(Et,ListaHijos)|Resto], [Et|R2]):- append(Resto, ListaHijos, R), anchura(R, R2).

/*
bin2gen(+ArbolBinario, -ArbolGenerico)
  es cierto si ArbolGenerico unifica con el arbol genérico equivalente
  a ArbolBinario.
*/
bin2gen(a(Et, nil, nil), a(Et, [])).
bin2gen(a(Et, HI, HD), a(Et, [RI, RD])):-  HI \= nil, HD \= nil, bin2gen(HI, RI), bin2gen(HD, RD).
bin2gen(a(Et, nil, HD), a(Et, [RD])):- HD \= nil, bin2gen(HD, RD).
bin2gen(a(Et, HI, nil), a(Et, [RI])):-  HI \= nil, bin2gen(HI, RI).


/*


Problemas Estado

9. Jarras


Problemas de estados

1. Definir el estado

   estado(L5, L3)
   
2. Definir estado inicial y final
   
   Estado inicial = estado(0, 0)
   Estado final   = estado(4, _)
   
3. Definir los movimientos 

   mov(Nombre, EstadoAnterior, EstadoPosterior)
   
   1. Llenar 5L o 3L
   2. Vaciar 5L o 3L
   3. Pasar 5L a 3L o 3L a 5L
*/   

   % Llenar   
   mov(llenar_5l, estado(_, L3), estado(5, L3) ).
   mov(llenar_3l, estado(L5, _), estado(L5, 3) ).
   
   % Vaciar
   mov(vaciar_5l, estado(_, L3), estado(0, L3) ).
   mov(vaciar_3l, estado(L5, _), estado(L5, 0) ).
   
   % Pasar de 5L a 3L
   mov(pasar_5la3l, estado(L5, L3), estado(0, T) ):- T is L5 + L3, T =< 3.
   mov(pasar_5la3l, estado(L5, L3), estado(L52 , 3) ):- T is L5 + L3, T > 3,
     L52 is T - 3.
   
   % Pasar 3L a 5L
   mov(pasar_3la5l, estado(L5, L3), estado(T, 0) ):- T is L5 + L3, T =< 5.
   mov(pasar_3la5l, estado(L5, L3), estado(5, L32) ):- T is L5 + L3, T > 5,
     L32 is T - 5.


/*

camino(+EstadoIni, +EstadoFinal, +Visitados, -Camino)
   es cierto si Camino unifica con la lista de nombres de movimientos
   necesarios para pasar de EstadoInicial al EstadoFinal sin repetir
   estados Visitados.
*/

camino(EstadoIni, EstadoIni, _, []).

camino(EstadoIni, EstadoFin, Visitados,  [Mov|Camino]):-
  mov(Mov, EstadoIni, EstadoTMP),
  \+ member(EstadoTMP, Visitados),
  camino(EstadoTMP, EstadoFin, [EstadoTMP|Visitados], Camino).










































