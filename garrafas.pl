/*

Problemas de estados

1. Definir el estado

   estado(L5, L3)
   
2. Definir estado inicial y final
   
   Estado inicial = estado(0, 0)
   Estado final   = estado(4, _)
   
3. Definir los movimientos 



   mov(Nombre, EstadoAnterior, EstadoPosterior)
   
   1. Llenar 5L o 3L
   2. Vaciar 5L o 3L
   3. Pasar 5L a 3L o 3L a 5L
*/   

   % Llenar   
   mov(llenar_5l, estado(_, L3), estado(5, L3) ).
   mov(llenar_3l, estado(L5, _), estado(L5, 3) ).
   
   % Vaciar
   mov(vaciar_5l, estado(_, L3), estado(0, L3) ).
   mov(vaciar_3l, estado(L5, _), estado(L5, 0) ).
   
   % Pasar de 5L a 3L
   mov(pasar_5la3l, estado(L5, L3), estado(0, T) ):- T is L5 + L3, T =< 3.
   mov(pasar_5la3l, estado(L5, L3), estado(L52 , 3) ):- T is L5 + L3, T > 3,
     L52 is T - 3.
   
   % Pasar 3L a 5L
   mov(pasar_3la5l, estado(L5, L3), estado(T, 0) ):- T is L5 + L3, T =< 5.
   mov(pasar_3la5l, estado(L5, L3), estado(5, L32) ):- T is L5 + L3, T > 5,
     L32 is T - 5.


/*

camino(+EstadoIni, +EstadoFinal, +Visitados, -Camino)
   es cierto si Camino unifica con la lista de nombres de movimientos
   necesarios para pasar de EstadoInicial al EstadoFinal sin repetir
   estados Visitados.
*/

camino(EstadoIni, EstadoIni, _, []).

camino(EstadoIni, EstadoFin, Visitados,  [Mov|Camino]):-
  mov(Mov, EstadoIni, EstadoTMP),
  \+ member(EstadoTMP, Visitados),
  camino(EstadoTMP, EstadoFin, [EstadoTMP|Visitados], Camino).
