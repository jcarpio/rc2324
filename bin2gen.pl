

/*

  bin2gen(+ArbolBinario, -ArbolGenerico)
  
  es cierto si ArbolGenerico unifica con un árbol genérico
  que es una traducción del árbol binario ArbolBinario.

  bin2gen(a(1,nil,nil), R).
  R = a(1,[]).

  bin2gen(a(1, a(2,nil,nil), a(3,nil,nil)), R).
  R = a(1, [a(2,[]), a(3,[])])  
  

*/
