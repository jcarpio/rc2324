/*

elemento_n0(+Pos, +Lista, -R)
  es cierto cuando R unifica con el elemento que
  ocupa la posición Pos de Lista empezando a contar desde el 0

*/

elemento_n0(0, [Cab|_], Cab).

elemento_n0(Pos, [_|Resto], Elem):-
  Pos2 is Pos-1, elemento_n0(Pos2, Resto, Elem). 
  
% elemento_n0(3, [1,2,3,4,5], R)
% elemento_n0(2, [2,3,4,5], R) 
