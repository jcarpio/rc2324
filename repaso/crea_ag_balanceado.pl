/*
 crea_ag(+ListaEtiquetas, -ArbolGenerico)
   es cierto si ArbolGenerico unifica con un árbol
   que contiene todas las etiquetas de ListaEtiquetas.
   No tiene solución (por definición) si la ListaEtiquetas
   está vacía. En este caso el árbol genérico será equivalente
   a un árbol binario balanceado.
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
 

[1,2,3,4,5,6,7,8,9,0]

              1                      1
        / / / | \ \ \               /  \
       2 3 4 5 6 7 8 9             2    3
                                  /  \  /  \
                                 4   5  6  7
                                / \  |
                               8   9 0

                  1
            /     |    \
           2      3     4
         5 6 7  8 9 0
         
*/

crea_ag([Cab|Resto], a(Cab, R)):-
    crea_lista_ag(Resto, R).

crea_lista_ag([], []).
crea_lista_ag(ListaEtiquetas, [A1, A2]):-
      length(ListaEtiquetas, L),
      Mitad is L div 2,
      length(L1, Mitad),
      append(L1, L2, ListaEtiquetas),
      crea_ag(L1, A1),
      crea_ag(L2, A2).
