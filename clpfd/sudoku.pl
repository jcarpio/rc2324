:- use_module(library(clpfd)).

/*

sudoku(?Sudoku9x9)
  es cierto si Sudoku9x9 unifica con un
  sudoku 9x9 váldo.
  1. Los valores de la matriz Sudoku están 
     en el rango de 1 a 9.
  2. Todos los valores por columnas tienes que
     ser únicos.
  3. Todos los valores por filas tienes que
     ser únicos
  4. En la matriz se definen 9 bloques de tamaño 3x3
     tomando las 3 primeras filas consecutivas, obtendremos
	 los tres primeros bloques 3x3.
	 En cada uno de los 9 bloques del sudoku los valores
	 tienen que ser distintos.
  

*/

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
