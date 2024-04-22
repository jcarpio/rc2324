
/*

Exercism Satellite

         1
	   /  \
	  2    3
	 / \  / \
	5  7 8   9
	
	inorden  [5,2,7,1,8,3,9]
	
	preorden [1,2,5,7,3,8,9]
	
	tree_traversals(T, Pre, In).
	
	 node(node(node(nil, 5, nil), 2, node(nil, 7, nil)), 1, node(node(nil, 8, nil), 3, node(nil, 9, nil)))
		
*/


tree_traversals(nil, [], []).
tree_traversals(node(LeftTree, Root, RightTree), [Root|Tail], Inorden):- 
  append(InLeft, [Root|InRight], Inorden),
  length(InLeft, L), length(PreLeft, L), 
  append(PreLeft, PreRight, Tail),  
  tree_traversals(LeftTree, PreLeft, InLeft), 
  tree_traversals(RightTree, PreRight, InRight).
