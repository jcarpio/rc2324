/* 
   Árboles genéricos
   
   n0 = a(E, []).
   No tenemos el árbol nulo (nil) en árboles genéricos!!
   
   a(E, [a(E1[...]), a(E2,[...]), a(E3, [...]), ...]
   
   Truco!!
   
   Para resolver los ejercicios de árboles genéricos
   lo haremos en dos partes!
   
   1. Hacer un predicado para listas de árboles
   2. Hacer un predicado que conecte al árbol con 
      su lista de árboles.
      
      
   cuenta_nodos(+ArbolGenerico, -N)
     es cierto si N unifica con el núemero de nodos
     de Arbol Generico.
 
   Principio de Inducción:
   1) P(n0)
   2) P(n-1) -> P(n)
   
   cuenta_nodos(+ListaArboles, -N)
     es cierto si N unifica con el número de nodos
     que contiene ListaArboles
   
 */    
     
  cuenta_nodos([], 0).
