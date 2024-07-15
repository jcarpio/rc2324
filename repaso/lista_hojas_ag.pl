/*
 * lista_hojasG(+ArbolGenerico, -ListaHojas)
 * Será cierto si ListaHojas unifica con una lista
 * que contenga las hojas de ArbolGenerico.
 * 
 * lista_hojas_lista_arbolesG(+ListaArboles, -ListaHojas)
 * Será cierto si ListaHojas unifica con la lista
 * de hojas de ListaArboles.
 * 
 */

lista_hojasG(a(E, []), [E]).

lista_hojasG(a(_, ListaHijos), ListaH) :-
    ListaHijos \= [],
    lista_hojas_lista_arboles(ListaHijos, ListaH).
    	

lista_hojas_lista_arboles([], []).
lista_hojas_lista_arboles([Cab|Resto], Resultado) :-
	lista_hojasG(Cab, LisC),
    lista_hojas_lista_arboles(Resto, LisR),
    append(LisC, LisR, Resultado).

arbol1(a(a, [a(b, []), a(c, [])])).
arbol2(a(1,[a(2,[a(3,[a(4,[a(5,[a(6,[a(7,[])])])])])])])).
arbol3(a(1,[a(2,[a(3,[]), a(4,[])]), a(5,[a(6,[]), a(7,[])])])).
