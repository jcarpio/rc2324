

%  Natural

% Principio de inducción

% 1) P es cierta para n0

% 2) n > n0, Si P(n-1) -> P(n)

             natural(N) :- N > 1, N2 is N - 1, natural(N2). 

natural(1).

natural(N) :- N > 1, N2 is N - 1, natural(N2).
