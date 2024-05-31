/*

Taks:
1. order_wool
2. hummer_wool
3. shape_wool
4. cut_sole
5. glue_sole

Task connection:
task hummer_wool need task order_wool
task shape_wool need task hummer_wool
task glue_sole need task cut_sole and task shape_wool

product_task_worker_time(mel, order, order1, 1).
product_task_worker_time(mel, hummer, hummer1, 2).
product_task_worker_time(mel, shape_wool, shaper1, 2).
product_task_worker_time(mel, cut_sole, cutter1, 1).
product_task_worker_time(mel, glue_sole, glue1, 3).

product_task_worker_time(yves, order, order1, 1).
product_task_worker_time(yves, hummer, hummer1, 2).
product_task_worker_time(yves, shape_wool, shaper1, 2).
product_task_worker_time(yves, cut_sole, cutter1, 1).
product_task_worker_time(yves, glue_sole, glue1, 3).

1. Representation:

req(P, T, W, T)-[ _, _]


*/

:- use_module(library(clpfd)).
:- use_module(library(reif)).

requirements(Rs) :-
        Goal = product_task_worker_time(Prod, Task, Worker, Time),
        setof(req(Prod, Task, Worker, Time), Goal, Rs0),
        maplist(req_with_slots, Rs0, Rs).

req_with_slots(R, R-Slots) :- R = req(_,_,_,N), length(Slots, N).

pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).

requirements_variables(Rs, Vars) :-
        requirements(Rs),
        pairs_slots(Rs, Vars),
        slots_per_week(SPW),
        Max #= SPW - 1,
        Vars ins 0..Max,
        products(Products),
        workers(Workers),
        tasks(Tasks),
		maplist(constrain_task(Rs), Tasks),
		maplist(constrain_worker(Rs), Workers),
		maplist(constrain_product(Rs), Products).

% Los slots de las tareas puder solaparse y tienen que respetar el orden definido
% por task_a_needs_task_b. Si una tarea tiene varios slots, estos deben ser consecutivos
constrain_task(Rs, Task) :-
        tfilter(task_req(Task), Rs, Sub),
		pairs_slots(Sub, Vs),
        all_different(Vs).       

% Los slots de un trabajador tienen que ser diferentes,
% un trabajador no puede estar haciendo dos tareas al mismo tiempo		
constrain_worker(Rs, Worker) :-
        tfilter(worker_req(Worker), Rs, Sub),
		pairs_slots(Sub, Vs),
        all_different(Vs).		
		
% El producto no necesita que sus slots sean diferentes. Se pueden
% solapar diferentes tareas de un producto

constrain_product(Rs, Product) :-
        tfilter(product_req(Product), Rs, Sub),
		pairs_slots(Sub, Vs),
        all_different(Vs).		
		
			
task_req(T0, req(_P,T1,_W,_N)-_, T) :- =(T0,T1,T).	


worker_req(W0, req(_P,_T,W1,_N)-_, W) :- =(W0,W1,W).

product_req(P0, req(P1,_T,_W,_N)-_, P) :- =(P0,P1,P).
		
workers(Workers) :-
        setof(W, P^T^N^product_task_worker_time(P,T,W,N), Workers).		
		
products(Products) :-
        setof(P, T^W^N^product_task_worker_time(P,T,W,N), Products).

tasks(Tasks) :-
        setof(T, P^W^N^product_task_worker_time(P,T,W,N), Tasks).	

strictly_ascending(Ls) :- chain(#<, Ls).


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Relate teachers and classes to list of days.

   Each day is a list of subjects (for classes), and a list of
   class/subject terms (for teachers). The predicate days_variables/2
   yields a list of days with the right dimensions, where each element
   is a free variable.

   We use the atom 'free' to denote a free slot, and the compound terms
   class_subject(C, S) and subject(S) to denote classes/subjects.
   This clean symbolic distinction is used to support subjects
   that are called 'free', and to improve generality and efficiency.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

days_variables(Days, Vs) :-
        slots_per_week(SPW),
        slots_per_day(SPD),
        NumDays #= SPW // SPD,
        length(Days, NumDays),
        length(Day, SPD),
        maplist(same_length(Day), Days),
        append(Days, Vs).
		
%---------------------------------------------------------------		
		
slots_per_week(294). % 7 days a week 

slots_per_day(42).	 % 10 minutes slot, 7 hours a day	

product_task_worker_time(mel, order, orderer1, 1).
product_task_worker_time(mel, hummer, hummer1, 2).
product_task_worker_time(mel, shape_wool, shaper1, 2).
product_task_worker_time(mel, cut_sole, cutter1, 1).
product_task_worker_time(mel, glue_sole, gluer1, 3).

product_task_worker_time(yves, order, orderer1, 1).
product_task_worker_time(yves, hummer, hummer1, 2).
product_task_worker_time(yves, shape_wool, shaper1, 2).
product_task_worker_time(yves, cut_sole, cutter1, 1).
product_task_worker_time(yves, glue_sole, gluer1, 3).

/*
Task connection:
task hummer_wool need task order_wool
task shape_wool need task hummer_wool
task glue_sole need task cut_sole and task shape_wool

*/

c(hummer_wool, order_wool).
task_a_needs_task_b(shape_wool, hummer_wool).
task_a_needs_task_b(glue_sole, cut_sole).
task_a_needs_task_b(glue_sole, shape_wool).
