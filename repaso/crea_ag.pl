
/*
 crea_ag(+ListaEtiquetas, -ArbolGenerico)
   es cierto si ArbolGenerico unifica con un árbol
   que contiene todas las etiquetas de ListaEtiquetas.
   No tiene solución (por definición) si la ListaEtiquetas
   está vacía.
   El árbol genérico más pequeño n0 = a(E, [])
   
   Principio de Inducción:
   1) P(n0)
   2) P(n-1) > P(n)
   
   Truco para los árboles genéricos
   1. Predicado par lista de árboles
   2. Predicado que conecta al árbol con su
      lista de hijos.
      
  crea_lista_ag(+ListaEtiquetas, -ListaAG)
    es cierto si ListaAG unifica con una lista
    de árboles que contiene todas las etiquetas
    de ListaEtiqueta.
 */

crea_lista_ag([], []).
crea_lista_ag([Cab|Resto], [a(Cab, ListaAG)]):-
    crea_lista_ag(Resto, ListaAG).

crea_ag([Cab|Resto], a(Cab, ListaAG) ):-
    crea_lista_ag(Resto, ListaAG).
