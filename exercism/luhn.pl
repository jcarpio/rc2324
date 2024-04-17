
codes2numbers([C], [N]):- number_codes(N, [C]). 
codes2numbers([Head|Tail], [N|R]):- codes2numbers(Tail, R), number_codes(N, [Head]).

valid(String):- string_codes(String, R), reverse(R, R2), 
  delete_blank(R2, R3), 
  codes2numbers(R3, R4), R4 \= [0], multi(R4, R5),
 sumlist(R5, R6), 0 is R6 mod 10.
 
is_valid(Code):- Code >= 48, Code =< 57.
is_valid(32).

is_number(Code):- Code >= 48, Code =< 57.

 
delete_blank([], []).
delete_blank([Head|Tail], R):- \+ is_number(Head), delete_blank(Tail, R). 
delete_blank([Head|Tail], [Head|R]):- is_number(Head), delete_blank(Tail, R). 
 
multi([], []).

multi([H], [H]):- H2 is H * 2, H2 > 9. 
multi([H], [H2]):- H2 is H * 2, H2 =< 9. 

multi([H1, H2|Tail], [H1, H2|R]):- H22 is H2 * 2, H22 > 9, 
 multi(Tail, R).
 
multi([H1, H2|Tail], [H1, H22|R]):- H22 is H2 * 2, H22 =< 9, 
 multi(Tail, R).
