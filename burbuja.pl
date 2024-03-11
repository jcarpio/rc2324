/*

burbuja(+Lista, -R)

ordenada(+Lista)

ordenada([]).

ordenada([Cab1, Cab2|Resto]):- 
  Cab1 < Cab2,
  ordenada([Cab2|Resto]).


*/
