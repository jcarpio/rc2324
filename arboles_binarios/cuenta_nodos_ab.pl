/*
cuenta_nodos_ab(+Arbol, -N)
  es cierto si N unifica con el número de elementos de Arbol
*/

cuenta_nodos_ab(nil, 0).

cuenta_nodos(a(_, HI, HD), R):-
  cuenta_nodos(HI, RI),
  cuenta_nodos(HD, RD),
  R is RI + RD + 1.
