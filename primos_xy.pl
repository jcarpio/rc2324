/*---------------------------------------------------
 primos_xy(+X, +Y, -ListaR)
   es cierto cuando ListaR unifica con una lista
   que contiene a los primos que van desde X hasta
  Y ambos incluidos en orden ascendente.
  
  primos_xy(1, 9, R)
  R = [1,2,3,5,7]
---------------------------------------------------*/

primos_xy(X, Y, [] ):- X > Y.

primos_xy(X, Y, [X|R]):- primo(X), X =< Y, X2 is X + 1, primos_xy(X2, Y, R).
  
primos_xy(X, Y, R):- \+ primo(X), X =< Y, X2 is X + 1, primos_xy(X2, Y, R).
  

/*
  lista_divisores(+N, +Rango, -Lista)
    es cierto si Lista unifica con los divisores de N que
	van desde 1 hasta Rango [1,Rango]. Y es un número entre 1 y N.
	
  lista_divisores(8, 8, R).
  R=[1, 2, 4, 8]
	
*/

lista_divisores(_, 1, [1]).

lista_divisores(N, Rango, [Rango|R]):- Rango > 1, Rango2 is Rango - 1,
   0 is mod(N,Rango), 
   lista_divisores(N, Rango2, R).
   
lista_divisores(N, Rango, R):- Rango > 1, Rango2 is Rango - 1,
   Mod is mod(N,Rango), Mod \= 0,
   lista_divisores(N, Rango2, R).
   

/*
  primo(+N)
    es cierto si N es un número primo.
*/

primo(N):- N > 1, lista_divisores(N, N, [_, _]).
primo(1).
