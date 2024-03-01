

/* num_elem(+Lista, ?Resultado)
    es cierto si Resultado unifica con el
	número de elementos de Lista
*/

% Caso base, caso 1 de la Inducción

num_elem([], 0).

% Caso recursivo, caso 2 de la inducción

% Si num_elem(Resto, ) -> num_elem(Lista)
% 
% num_elem(Lista,  ):- num_elem(Resto, ).

num_elem([_|Resto], R2):- num_elem(Resto, R), R2 is R+1. 
