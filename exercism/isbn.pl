% isbn(Isbn).

isbn(Isbn):-  string_to_number_list(Isbn, IsbnList), isbn_check_number(IsbnList, 0).

isbn_multi([N], 1, N).
isbn_multi([H|T], N,  R2):- N > 0, N2 is N - 1, isbn_multi(T, N2, R), R2 is N * H + R. 

isbn_check_number(Number_list, Number):- length(Number_list, 10), isbn_multi(Number_list, 10, R), Number is R mod 11.


head_tail(String, Head, Tail):-
  sub_string(String, 0,1,A,Head),
  sub_string(String, 1,A,_,Tail).
   
string_to_number_list("", []).
string_to_number_list("-", []).
string_to_number_list("X", [10]).

string_to_number_list(String, [N|R]):- head_tail(String, H, Tail), string_to_number_list(Tail, R), number_string(N, H).

string_to_number_list(String, R):- head_tail(String, "-", Tail), string_to_number_list(Tail, R).

/*
?- sub_string("abcde", 0,1,A,R).
A = 4,
R = "a".

?- number_string(R, "1").
R = 1.
*/
