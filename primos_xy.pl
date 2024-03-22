/*---------------------------------------------------
 primos_xy(+X, +Y, -ListaR)
   es cierto cuando ListaR unifica con una lista
   que contiene a los primos que van desde X hasta
  Y ambos incluidos en orden ascendente.
  
  primos_xy(1, 9, R)
  R = [1,2,3,5,7]
---------------------------------------------------*/


/*
  lista_divisores(+N, +Y, -Lista)
    es cierto si Lista unifica con los divisores de N que
	van desde 1 hasta Y. Y es un número entre 1 y N
	
*/

lista_divisores(_, 1, [1]).

lista_divisores(N, Y, [Y|R]):- Y2 is Y-1, 0 is mod(N,Y), lista_divisores(N, Y2, R).

lista_divisores(N, Y, R):- Y2 is Y-1, M is mod(N,Y), M \= 0, lista_divisores(N, Y2, R).
