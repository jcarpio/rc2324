/*

pertenece(+Elem, +Lista)
  es cierto si Elem pertenece a Lista
  
*/

pertenece(Elem, [Elem|_]).

pertenece(Elem, [_|Resto]):- pertenece(Elem, Resto).
