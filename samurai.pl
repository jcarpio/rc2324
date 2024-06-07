
:- use_module(library(clpfd)).

samurai([S1, S2, S3, S4, S5]):- sudoku(S5), 
                             write("\nSudoku S5\n"),
                             maplist(label, S5), maplist(portray_clause, S5),                           
                             esquina_si(S5, ESI), esquina_id(S1, ESI), 
                             write("Esquina Sup Izq\n"),
                             write(ESI), 											 
			     sudoku(S1),
			     write("\nSudoku S1\n"),			 
			     maplist(label, S1), maplist(portray_clause, S1),
			     esquina_sd(S5, ESD), esquina_ii(S2, ESD), 
			     write("Esquina Sup Dch\n"),
                             write(ESD),
			     sudoku(S2), 
			     write("\nSudoku S2\n"),							 
			     maplist(label, S2), maplist(portray_clause, S2),
			     esquina_ii(S5, EII), esquina_sd(S3, EII),
			     write("Esquina Inf Izq\n"),
                             write(EII),
			     sudoku(S3),
                             write("\nSudoku S3\n"),							 
			     maplist(label, S3), maplist(portray_clause, S3),							 
			     esquina_id(S5, EID), esquina_si(S4, EID),
			     write("Esquina Inf Dch\n"),
                             write(EID),
			     sudoku(S4),
                             write("\nSudoku S4\n"),						 
			     maplist(label, S4), maplist(portray_clause, S4).
							 
sudoku(Rows) :-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).
		
esquina_si(Sudoku, [[A,B,C], [D,E,F], [G,H,I]]):- Sudoku = [[A,B,C|_],[D,E,F|_], [G,H,I|_]|_].
esquina_sd(Sudoku, [[A,B,C], [D,E,F], [G,H,I]]):- Sudoku = [[_,_,_,_,_,_,A,B,C], 
                                 [_,_,_,_,_,_,D,E,F],
								 [_,_,_,_,_,_,G,H,I]|_].
esquina_ii(Sudoku, [[A,B,C], [D,E,F], [G,H,I]]):- Sudoku = [_,_,_,_,_,_,[A,B,C|_],[D,E,F|_],[G,H,I|_]].
esquina_id(Sudoku, [[A,B,C], [D,E,F], [G,H,I]]):- Sudoku = [_,_,_,_,_,_,[_,_,_,_,_,_,A,B,C],
                                                               [_,_,_,_,_,_,D,E,F],
															   [_,_,_,_,_,_,G,H,I]].								 
								 
		
% sudoku(Rows), maplist(label, Rows), maplist(portray_clause, Rows).		
