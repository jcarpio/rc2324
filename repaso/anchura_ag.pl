/*
 
 anchura_ag(+ArbolGenerico, -RecorridoAnchura)
   es cierto si RecorridoAnchura unifica con la
   la lista de etiquetas resultado de recorrer
   el ArbolGenerico en anchura.
 
           1
       /  |    \
      2   3     4  [5, 6, 7] [8] [9,10,11]
     / \  |   / | \
   5 6 7  8  9 10 11
   
   [1,2,3,4,5,6,7,8,9,10,11]

*/

anchura_ag(a(E, ListaHijos), [E|R]):-
   anchura_lista_ag(ListaHijos, R).

anchura_lista_ag([], []).
anchura_lista_ag([a(E, ListaHijos)|Resto], [E|R2]):-
    append(Resto, ListaHijos, R),
    anchura_lista_ag(R, R2).

arbol1(a(1,[a(2,[a(3,[]), a(4,[])]), a(5,[a(6,[]), a(7,[])])])).
    
