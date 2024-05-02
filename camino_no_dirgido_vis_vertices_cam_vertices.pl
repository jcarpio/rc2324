
/*

Grafos:


Representación: g(ListaAristas, ListaVertices)

          a ------------- b
            \            /
			 \          /
			  \        /
               c------d
			   Grafo 1
			   
Grafo Digido

a-----> b
a está conectado con b
b no está conectado con a

Grafo no dirigido

a ----- b
a está conectado con b
b está conectado con a

			   

*/

grafo(1, g([a,b,c,d], [a(a,b), a(a,c), a(c,d), a(d,b)]) ).

/*
camino(+Grafo, +Ini, +Fin, +Visitados, -Camino)
  es cierto si Camino unifica con la lista de vertices o
  aristas, que van desde Ini hasta Fin sin repetir vértices
  o aristas.

*/

camino(_, Ini, Ini, _, [Ini]).

camino(Grafo, Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(Grafo, Ini, TMP),
  \+ member(TMP, Visitados),  
  camino(Grafo, TMP, Fin, [TMP|Visitados], Camino).

/*

conectado(+Grafo, +Ini, +Fin)
  es cierto si los vértices Ini y Fin tienen una arista
  que los conecta (conexión directa) en el Grafo.
*/

conectado(g(_, Aristas), Ini, Fin):- 
  member(a(Ini, Fin), Aristas). 
  
/* Siguiente linea solo para grafos no dirigidos */ 
conectado(g(_, Aristas), Ini, Fin):- 
  member(a(Fin, Ini), Aristas). 




