
/*

genera_lista(+N, +Rango -R)
  es cierto si R unifica con una lista que contiene
  N elementos con valores aleatorios entre 1 y Rango

*/

genera_lista(0, _, []).

genera_lista(N, Rango, [Elem|R]):-  N > 0, N2 is N-1, 
  genera_lista(N2, Rango, R), random(1, Rango, Elem).
