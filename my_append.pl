

/*

my_append(+Lista1, +Lista2, -Resultado)
  es cierto si Resultado unifica con una lista que 
  contiene los elementos de Lista1 seguidos de los
  elementos de Lista2.
  
  ? my_append([1,2,3], [4,5,6], R)
  R = [1,2,3,4,5,6]

*/

% utilizo solo una variable para construir la inducción
% en este caso utilizaré la primera variable, la segunda
% variable no la cambiamos
my_append([], L2, L2).

my_append([Cab|Resto], L2, [Cab|R]):-
  my_append(Resto, L2, R).
