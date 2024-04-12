
/*
mas_veces(+Lista, -Elem, -N)
  es cierto si Elem unifica con el elemento que se repite más veces
  en Lista y N es el número de veces que se repite.

  mas_veces([a,a,b,c,c,d,a,e], E, N).
  E = a
  N = 3
  
*/

mas_veces(Lista, E, N):- msort(Lista, ListaOrd),
                    comprime(ListaOrd, ListaComp),
					mayor_n(ListaComp, E, N).
					 
/*
mayor_n(+Lista, -E, -N)
  es cierto si E unifica con el elemento que se repite más veces 
  en Lista y N unifica con número de veces que se repite
  
  mayor_n([(a,3), (b,1), (c,2), (d,1), (e,1)], E, N)
  E = a 
  N = 3  
*/	

mayor_n([(Cab,N)], Cab, N).
mayor_n([(Cab,N)|Resto], Cab,  N):- mayor_n(Resto, _, NR), N >= NR.   
mayor_n([(_,N)|Resto], E,  NR):- mayor_n(Resto, E, NR), N < NR.   
				 

/*
comprime(+Lista, -Resultado)
  es cierto cuando Resultado unifica con una lista de la siguiente 
  forma:

  comprime([a,a,b,c,c,d,a,e], R).
  R = [(a,2), (b,1), (c,2), (d,1), (a,1), (e,1)]
  
  comprime([a,b,c,c,d,a,e], R)
  R = [(a,1), (b,1), (c,2), (d,1), (a,1), (e,1)]
  
  comprime([a,b,c,c,d,a,e], R).
  R = [(a,1), (b,1), (c,2), (d,1), (a,1), (e,1)]
  
*/

comprime([], []).

comprime([E], [(E,1)]).

comprime([Cab, Cab|Resto], [(Cab,N2)|R]):-  
  comprime([Cab|Resto], [(Cab, N)|R]), N2 is N+1.
  
comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2,
  comprime([Cab2|Resto], R).
  
  

