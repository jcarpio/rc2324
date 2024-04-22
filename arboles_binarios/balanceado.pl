/*

balanceado(+ArbolBinario)
 es cierto si, para todo nodo, la diferencia
 entre la altura del sub árbol izquierdo y
 el sub árbol derecho es como máximo 1 en valor absoluto.
 
         1            1
        /            / \  
	   2            2   3
	  /            /
     3	          4 
 No balanceado    Balanceado

*/


balanceado(a(_, Hi, Hd)):-
  altura(Hi, Ai),
  altura(Hd, Ad),
  Dif is Ai - Ad, 1 =< abs(Dif),
  balanceado(Hi), balanceado(Hd).

/*
altura(+ArbolBinario, -Altura)
  es cierto si Altura unifica con la altura de ArbolBinario.

*/


altura(nil, 0).

altura(a(_, Hi, Hd), A):-
  altura(Hi, Ai), altura(Hd, Ad), A is 1 + max(Ai, Ad).
  
  
