/*

ord_ins(+Lista, -R)
  es cierto si R unifica con una lista que contiene
  los elementos de Lista ordenados de menor a mayor.
  
*/

ord_ins([], []).

ord_ins([Cab|Resto], R2):-  ord_ins(Resto, R), 
   ins_en_ord(Cab, R, R2).
   
   
/*
ins_en_ord(+Elem, +Lista, -R)
  es cierto si R unifica con una lista que
  contiene los elementos de Lista (que es una 
  lista ordenada de menor a mayor) con
  Elem insertado en su posición correcta.

*/

ins_en_ord(Elem, [], [Elem]).

ins_en_ord(Elem, [Cab|Resto], [Elem, Cab|Resto]):-
   Elem =< Cab.
   
ins_en_ord(Elem, [Cab|Resto], [Cab|R]):-
   Elem > Cab, ins_en_ord(Elem, Resto, R).
   






