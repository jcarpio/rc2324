:- use_module(library(clpfd)).

requirements(Rs) :-
        Goal = class_subject_teacher_times(Class,Subject,Teacher,Number),
        setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
        maplist(req_with_slots, Rs0, Rs).

req_with_slots(R, R-Slots) :- R = req(_,_,_,N), length(Slots, N).

classes(Classes) :-
        setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), Classes).

teachers(Teachers) :-
        setof(T, C^S^N^class_subject_teacher_times(C,S,T,N), Teachers).
		
rooms(Rooms) :-
        findall(Room, room_alloc(Room,_C,_S,_Slot), Rooms0),
        sort(Rooms0, Rooms).
		
pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).
		
requirements_variables(Rs, Vars) :-
        requirements(Rs),
        pairs_slots(Rs, Vars),
        slots_per_week(SPW),
        Max #= SPW - 1,
        Vars ins 0..Max,
        maplist(constrain_subject, Rs),
        classes(Classes),
        teachers(Teachers),
        rooms(Rooms),
        maplist(constrain_teacher(Rs), Teachers),
        maplist(constrain_class(Rs), Classes),
        maplist(constrain_room(Rs), Rooms).		

constrain_subject(req(Class,Subj,_Teacher,_Num)-Slots) :-
        strictly_ascending(Slots), % break symmetry
        maplist(slot_quotient, Slots, Qs0),
        findall(F-S, coupling(Class,Subj,F,S), Cs),
        maplist(slots_couplings(Slots), Cs),
        pairs_values(Cs, Seconds0),
        sort(Seconds0, Seconds),
        list_without_nths(Qs0, Seconds, Qs),
        strictly_ascending(Qs).
		
strictly_ascending(Ls) :- chain(Ls, #<).

% 
slot_quotient(S, Q) :-
        slots_per_day(SPD),
        Q #= S // SPD.		

slots_per_week(35).

slots_per_day(7).

class_subject_teacher_times('1a', deu, sjk1, 4).
class_subject_teacher_times('1a', mat, mat1, 5).
class_subject_teacher_times('1a', eng, anj1, 3).
class_subject_teacher_times('1a', h, zgo1, 2).
class_subject_teacher_times('1a', geo, geo1, 2).
class_subject_teacher_times('1a', ch, kem1, 2).
class_subject_teacher_times('1a', bio, bio1, 2).
class_subject_teacher_times('1a', ph, fiz1, 2).
class_subject_teacher_times('1a', f, rai1, 2).
class_subject_teacher_times('1a', lat, atvz1, 3).
class_subject_teacher_times('1b', deu, sjk1, 4).

room_alloc(r1, '1a', deu, 0).
room_alloc(r2, '1a', deu, 1).

coupling('1a', deu, 2, 3).
