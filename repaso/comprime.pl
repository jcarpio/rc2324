/*
 
 comprime(+Lista, -R)
   es cierto si R unifica con una lista de 
   esta forma
   
   comprime([a,a,b,c,c,c,d,e,f,f,f], R).
   R=[(a,2),(b,1),(c,3),(d,1),(e,1),(f,3)]
   
   [a,b,c,c,c,d,e,f,f,f] -> 
       [(a,1),(b,1),(c,3),(d,1),(e,1),(f,3)]
   

  Principio de Inducción (Marteño)
  1) P(0)
  2) P(n-1) -> P(n)
 
 */

comprime([], []).
comprime([E], [(E,1)]).
comprime([Cab, Cab|Resto], [(Cab,N2)|R]):-
    comprime([Cab|Resto], [(Cab,N)|R]),
    N2 is N + 1.
comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):-
    Cab1 \= Cab2,
    comprime([Cab2|Resto], R).
