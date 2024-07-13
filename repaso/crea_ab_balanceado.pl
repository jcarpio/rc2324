/*
 crea_ab_balanceado(+ListaEtiquetas, -ArbolBinario)
   es cierto si ArbolBinario unifica
   con un ábol binario balanceado que
   contiene todas las etiquetas de 
   ListaEtiquetas.

Principio de inducción:
1) P(n0).
2) Para todo n>n0, P(n-1) -> P(n)

Todos los casos una única vez!
 Linea 16 para lista de tamaño 0
 Linea 19 a 25 para listas de 1 o más elementos
*/

crea_ab_balanceado([], nil).

crea_ab_balanceado(Lista, a(E, A1, A2) ):-
    length(Lista, L),
    Mitad is L div 2,
    length(L1, Mitad),
    append(L1, [E|L2], Lista),
    crea_ab_balanceado(L1, A1),
    crea_ab_balanceado(L2, A2).
