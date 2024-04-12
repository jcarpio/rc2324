
/*
crea_ab(+Lista, -ArbolBinario)
  es cierto si ArbolBinario unifica con un Árbol Binario que
  contiene en sus etiquetas extactamente todos los elementos de Lista.
  
  
   ?- crea_ab([1,2,3,4,5,6,7,8], R).
R = a(1, a(2, a(3, nil, nil), a(4, nil, nil)), a(5, a(6, nil, nil), a(7, nil, a(8, nil, nil)))).
  
                1
			   / \ 
			  /   \ 
			 2     5
            / \   / \
           3   4 6	 7		
             
*/

crea_ab([], nil).
crea_ab([Cab|Lista], a(Cab, HI, HD)):- length(Lista, L), L2 is L div 2, 
                             length(Sub1, L2),
                             append(Sub1, Sub2, Lista),
							 crea_ab(Sub1, HI),
							 crea_ab(Sub2, HD).


							 
							 
							 
							 
							 
							 
							 
							 
crea_listas1(Lista, Sub1, Sub2):- length(Lista, L), L2 is L div 2, length(Sub1, L2),
                     append(Sub1, Sub2, Lista).
					 
crea_listas2(Lista, Sub1, Sub2):- length(Lista, L), L2 is L div 2, 
                     append(Sub1, Sub2, Lista), length(Sub1, L2).
                           
