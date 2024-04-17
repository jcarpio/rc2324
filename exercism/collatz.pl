:- use_module(library(clpfd)).

% collatz_steps(N, Steps).

even(N) :- 0 is N mod 2.
odd(N) :- Mod is N mod 2, Mod \= 0.


collatz_steps(1, 0).

collatz_steps(N, Steps2):- N > 1, even(N), 
  N2 #= N div 2, collatz_steps(N2, Steps), Steps2 #= Steps + 1.

collatz_steps(N, Steps2):- N > 1, odd(N), 
  N2 #= N * 3 + 1, collatz_steps(N2, Steps), Steps2 #= Steps + 1. 
