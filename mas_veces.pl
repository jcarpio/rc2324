%------------------------------------------------------
% mas_veces(+Lista, -Elem, -Num)
%es cierto cuando Elem unifica con el elemento
%que se repite más veces en la lista Lista
%y Num unifica con el número de veces que se
%repite dicho elemento.


   mas_veces([1,1,2,3,3,1,2,4,5], Elem, N).   
   Elem = 1
   N = 3
      
%------------------------------------------------------



/*

comprime([1,1,1,2,2,3,3,4,5], R).
R = [(1,3], (2,2), (3,2), (4,1), (5,1)]

*/
