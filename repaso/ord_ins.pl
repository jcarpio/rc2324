/*
 Ordenaciones:
 
 Inserción
 Burbuja
 QuickSort
 
 Ordenación por Inserción
 
 insertar_ord(+Elem, +ListaOrd, -R)
   es cierto si R unifica con una
   lista que contiene los elementos
   de ListaOrd, que es una lista ordena,
   con Elem insertado en la posición
   correcta.
   
 ord_ins(+Lista, -R)
   es cierto si R unifica con una lista
   que conitiene los elementos de Lista
   ordenados de menor a mayor.
   
   Principio de inducción:
   1) P(n0)
   2) P(n-1) -> p(n)
   
*/

ord_ins([], []).
ord_ins([Cab|Resto], R2):-
    ord_ins(Resto, R),
    insertar_ord(Cab, R, R2).

insertar_ord(Elem, [], [Elem]).
insertar_ord(Elem, [Cab|Resto], [Elem,Cab|Resto]):-
    Elem =< Cab.
insertar_ord(Elem, [Cab|Resto], [Cab|R]):-
    Elem > Cab,
    insertar_ord(Elem, Resto, R).
