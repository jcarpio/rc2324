
/* Arboles Genéricos

      1
	/ | \ 
   2  3  4
   
   a(1, [a(2,[]), a(3,[]), a(4,[])])
   
    1
	
   a(1,[])
     
   1. Predicado para árboles
   2. Predicado para lista de árboles
      
*/

nodos_ag(a(_, ListaArboles), R):-
   nodos_lag(ListaArboles, RL), R is RL + 1.
   
nodos_lag([], 0).
nodos_lag([Cab|Resto], R):-
 nodos_ag(Cab, RC),  
 nodos_lag(Resto, RR),
 R is RC + RR.
