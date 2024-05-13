:- use_module(library(clpfd)).

samurai():-sudoku(R1,[L1,L2,L3,L4]), maplist(label, R1), maplist(portray_clause, R1),sudoku(R2,[L4,R11,R12,R13]),maplist(label, R2), maplist(portray_clause, R2),sudoku(R3,[R31,L3,R32,R33]),maplist(label, R3), maplist(portray_clause, R3),sudoku(R4,[R41,R42,L2,R43]),maplist(label, R4), maplist(portray_clause, R4),sudoku(R5,[R51,R52,R53,L1]),maplist(label, R5), maplist(portray_clause, R5).

sudoku(Rows,[L1,L2,L3,L4]) :-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
	cortarI(As,Bs,Cs,Aiz),
	L1=Aiz,
	cortarD(As,Bs,Cs,Ade),
	L2=Ade,
	cortarI(Gs,Hs,Is,Biz),
	L3=Biz,
	cortarD(Gs,Hs,Is,Bde),
	L4=Bde,
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).
	
	

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).

cortarD(La,Lb,Lc,L):- length(L1,3),length(L2,3),length(L3,3),append(_,L1,Ls1),append(_,L2,Ls2),append(_,L3,Ls3),append([Ls1,Ls2,Ls3],L).
cortarI(La,Lb,Lc,L):- length(L1,3),length(L2,3),length(L3,3),append(L1,_,Ls1),append(L2,_,Ls2),append(L3,_,Ls3),append([Ls1,Ls2,Ls3],L).
