/*
 
 lista_hojas(+ArbolBinario, -ListaHojas)
   es cierto si ListaHojas unifica con una lista 
   que contiene todas las hojas de ArbolBinario.
 
 Principio de Inducción
 
 1. P(n0)
 2. P(n-1) -> P(n)
    P(N) :- N2 is N-1, P(N2).

  Cada caso debe estar contenplado una única vez!
  
*/

lista_hoja(nil, []).

lista_hojas(a(E, nil, nil), [E]).

hoja( a(_, nil, nil) ).

lista_hojas(a(_, HI, HD), R):-
  \+ hoja(a(_, HI, HD)),
  lista_hojas(HI, RI),
  lista_hojas(HD, RD),
  append(RI, RD, R).
