
% Factorial

/*
comentario de bloque
*/

% Principio de inducción matemático

% factorial(+N, -R)
%  es cierto si R unifica con un número que representa
%  el factorial de N 

factorial(1, 1).

% factorial(N) es N * factorial(N-1)

% una variable una vez que toma un valor, nunca cambia 
% hasta que termina su ámbito. 

factorial(N, R2) :- N > 1, N2 is N - 1, factorial(N2, R), R2 is R * N.

