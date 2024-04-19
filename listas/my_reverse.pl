

/*

my_reverse(+Lista, -R)
  es cierto si R unifica con una lista que 
  contine los elementos de Lista en orden 
  inverso.
  
  my_reverse([1,2,3,4,5], )  -> Resto [2,3,4,5] -> [5,4,3,2]
             [5,4,3,2,1]
*/

my_reverse([], []).

my_reverse([Cab|Resto], R2):- my_reverse(Resto, R),
   append(R, [Cab], R2). 
   
/* insertar_final(+Elem, +Lista, +R)
  es cierto si R unifica con una lista que contiene
  los elementos de Lista con Elem insertado al final.
*/

/* insertar_final(5, [1,2,3,4], )  -> insertar_final(5, [2,3,4], */

insertar_final(Elem, [], [Elem]).

% --------- N ---------    ----------- N-1 ---------   
insertar_final(Elem, [Cab|Resto], [Cab|R]) :-  
   insertar_final(Elem, Resto, R).
