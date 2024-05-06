

/*

Grafos:

Representación:

g(ListaAristas, ListaVertices).
      1                    2
                           b
                          / \
                         /   \
  a ------> b          a ---- c --- d    
 Grafo dirigido      grafo no dirigido
  
*/

grafo(1, g([a,b], [a(a,b)]) ).
grafo(2, g([a,b,c,d], [a(a,b), a(a,c), a(b,c), a(c,d)]) ).
grafo(3, g([a,b,c,d,e], [a(a,b), a(a,c), a(b,c), a(b,d), a(b,e), a(c,d), a(c,e), a(d,e)] ) ).
grafo(4, g([a,b,c,d,e,f], [a(a,b), a(b,c), a(b,f), a(b,d), a(c,d), a(f,d), a(d,e)] ) ).

/*

camino(+Grafo, +Ini, +Fin, +Visitados, -Camino)
  es cierto si camino unifica con una lista de vértices o arista,
  desde Ini hasta Fin sin repetir vértices o aristas

*/

camino(_, Ini, Ini, _, []).

camino(Grafo, Ini, Fin, Visitados, [a(Ini,TMP)|Camino]):-
  conectado(Grafo, Ini, TMP),
  \+ member(a(Ini,TMP), Visitados),
  camino(Grafo, TMP, Fin, [a(Ini,TMP), a(TMP,Ini)|Visitados], Camino).

/*

conectado(Grafo, Ini, Fin)
  es cierto si existe una conexión directa (arista), entre Ini y Fin en el Grafo.

*/

conectado(g(_, ListaAristas), Ini, Fin):- member(a(Ini,Fin), ListaAristas). 
% Si el grafo es no dirigido, utilizo las dos reglas
% Si el grafo es dirigido solo utilizo la primera regla
conectado(g(_, ListaAristas), Ini, Fin):- member(a(Fin,Ini), ListaAristas).


ciclo(Grafo, V, Ciclos):-  findall(Camino, camino(Grafo, V, V, [], Camino), Ciclos).

ciclos(G, Ciclos):- G = g(Vertices, _), member(V, Vertices), 
  findall(Ciclo, ciclo(G, V, Ciclo), Ciclos).

%  grafo(4, G), findall(R, ciclos(G, R), Solucion).  
