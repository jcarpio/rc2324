/*

Taks:
1. order_wool
2. hummer_wool
3. shape_wool
4. cut_sole
5. glue_sole

Task connection:
task 2 need task 1
task 3 need task 2
task 4 need task 4 and task 3

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

prod(P, T, W, T)-[ _, _]


*/

:- use_module(library(clpfd)).

requirements(Rs) :-
        Goal = product_task_worker_time(Prod, Task, Worker, Time),
        setof(req(Prod, Task, Worker, Time), Goal, Rs0),
        maplist(req_with_slots, Rs0, Rs).

req_with_slots(R, R-Slots) :- R = req(_,_,_,N), length(Slots, N).

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
