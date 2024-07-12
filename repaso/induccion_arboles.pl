
/*
 
 Listas: 



 Comprime, Mas veces, Invertir, QuickSort, Inserción, Burbuja, primos_xy, permutar, my_append

 Árboles
 
 
 Principio de Inducción:

Queremos demostrar una propiedad P para todos
los elementos de un conjunto S. Los elementos
del conjunto S tiene que ser ordenable.

Para todo elemento de S,  sean x, y, z que pertenecen
a S. Siempre podré decir si x =< y o si z =< y

Tendremos en S un elemento más pequeño n0

Listas: n0 = []
Árboles binarios: n0 = nil
Árbol genérico: n0 = a(_, [])

 1. P tiene que ser cierta para n0. P(n0) es verdad.
 
 2. n > n0, Si P(n-1) es cierto, entonces P(n)
    P(n-1) -> P(n)
    
    
    P(N, RT) :- N2 is N-1, P(N2, R).
 
 */
