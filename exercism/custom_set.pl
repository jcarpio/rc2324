create_set(Set):- is_empty(Set).

create_set(Data, Data2):- sort(Data, Data2).

add(Value, Set, R):- sort([Value|Set], R).

is_empty([]).

in_set(Value, Set):- member(Value, Set).

is_subset([], _).
is_subset([E], Set2):- member(E, Set2).
is_subset([H|T], Set2):- is_subset(T, Set2), member(H, Set2).

is_disjoint(Set1, Set2):- intersection(Set1, Set2, []).

difference([], _, []).
difference(Set1, [], Set1).
difference(Set1, [H|T], R):- difference(Set1, T, Difference), append(L1, [H|L2], Difference), append(L1, L2, R).

difference(Set1, [H|T], Difference):- difference(Set1, T, Difference), \+ member(H, Difference).

intersection([], _, []).
intersection([H|T], Set2, [H|Intersection]):- intersection(T, Set2, Intersection), member(H, Set2). 
intersection([H|T], Set2, Intersection):- intersection(T, Set2, Intersection), \+ member(H, Set2). 

union(Set1, Set2, Union2):- append(Set1, Set2, Union), sort(Union, Union2).
