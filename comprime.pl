/*


comprime(+Lista, -Resultado)
  es cierto si Resultado unifica con una lista
  de la siguiente forma
  
  ? comprime([a,a,a,b,b,c,c,a], R).
  R = [(a,3), (b,2), (c,2), (a,1)]
  
  % variante 1
  ? comprime([a,a,a,b,b,c,c,a], R).
  R = [(a,3), (b,2), (c,2), a]
  
  % variante 2 
  ? comprime([a,a,a,b,b,c,c,a], R).
  R = [a-3, b-2, c-2, a-1]
  
  % variante 3 
  ? comprime([a,a,a,b,b,c,c,a], R).
  R = [a-3, b-2, c-2, a]
  
  
  Caso 1: 1º y 2º de la lista son iguales
  [a,a,a,b,b,c,c,a]         -> [(a,3), (b,2), (c,2), (a,1)]
  
  Resto -> [a,a,b,b,c,c,a]   -> [(a,2), (b,2), (c,2), (a,1)]
  
  Caso 2: 1º y 2º de la lista son distintos
  [d,a,a,a,b,b,c,c,a] -> [(d,1),(a,3), (b,2), (c,2), (a,1)]
  
  [a,a,a,b,b,c,c,a]   ->       [(a,3), (b,2), (c,2), (a,1)]

*/

% solución para la lista vacía
comprime([], []).

comprime([Elem], [(Elem,1)]).

% le pregunto al n-1, al Resto

% Caso 1: 
comprime([Cab|Resto], [(Cab,N2)|R]):-
   comprime(Resto, [(Cab,N)|R]), N2 is N+1. 
    
% Caso 2:   
comprime([Cab|Resto], [(Cab,1),(CabR,N)|R]):-
   comprime(Resto, [(CabR,N)|R]), Cab \= CabR.
   
   
   
   
   
   
   
