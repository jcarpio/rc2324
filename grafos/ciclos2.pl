% Ciclos de un grafo


grafo(1, g([a,b], [a(a,b)]) ).
grafo(2, g([a,b,c,d], [a(a,b), a(a,c), a(b,c), a(c,d)]) ).
grafo(3, g([a,b,c,d,e], [a(a,b), a(a,c), a(b,c), a(b,d), a(b,e), a(c,d), a(c,e), a(d,e)] ) ).
grafo(4, g([a,b,c,d,e,f], [a(a,b), a(b,c), a(b,f), a(b,d), a(c,d), a(f,d), a(d,e)] ) ).


% conectado(Grafo, Ini, Fin)
% cierto si el vértice Ini está conectado mediante una arista
% con el vértice Fin en Grafo.

conectado(g(_, A), Ini, Fin) :- member(a(Ini,Fin), A).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso)
% es cierto si Camino unifica con el camino representado
% como vértices/aristas que va desde 
% inicio hasta Fin sin repetir vértices/aristas y con un
% coste total de Peso.

% Camino como lista de vértices y visitados como lista de aristas
camino(g(_,A), Ini, Fin, _ , [Ini,Fin]):- member(a(Ini,Fin), A).

camino(G, Ini, Fin, Visitados, [Ini|Camino]):-
  conectado(G, Ini, Tmp), 
  \+ member(a(Ini,Tmp), Visitados), 
  camino(G, Tmp, Fin, [a(Ini,Tmp)|Visitados], Camino).
  
ciclos(g(V,A), R):-      
   bagof(Ciclo, ciclo(grafo(V,A), Ciclo), R). 
   
ciclo(g(V,A), Ciclo):- 
  member(Vertice, V), 
  camino(grafo(V,A), Vertice, Vertice, [], Ciclo).   
   
  
