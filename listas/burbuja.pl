
% burbuja(+Lista, -R)

% ordenada(+Lista)

ordenada([]).

ordenada([_]).

ordenada([Cab1, Cab2|Resto]):- 
  Cab1 < Cab2,
  ordenada([Cab2|Resto]).

% burbuja([1,5,3,4], ).

burbuja(Lista, Lista):- ordenada(Lista).

burbuja(Lista, R):- append(L1, [E1,E2|L2], Lista), E1 > E2,
                    append(L1, [E2, E1|L2], Temp),
				    burbuja(Temp, R).
