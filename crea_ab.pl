
/*
crea_ab(+Lista, -ArbolBinario)
  es cierto si ArbolBinario unifica con un Árbol Binario que
  contiene en sus etiquetas extactamente todos los elementos de Lista.
*/


crea_ab(Lista,   ):- length(Lista, L), L2 is L div 2, length(Sub1, L2),
                     append(Sub1, Sub2, Lista).
