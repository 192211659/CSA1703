on(floor, monkey).
on(floor, box).
on(floor, chair).
at(monkey, room_center).
at(box, room_center).
at(chair, room_left).
at(bananas, ceiling).
has(bananas, monkey).
move(monkey, room_center, room_left) :-
    at(monkey, room_center),
    at(chair, room_left),
    not(has(bananas, monkey)),
    not(on(floor, bananas)),
    assert(at(monkey, room_left)),
    retract(at(monkey, room_center)).
move(monkey, room_left, room_center) :-
    at(monkey, room_left),
    at(chair, room_left),
    not(has(bananas, monkey)),
    not(on(floor, bananas)),
    assert(at(monkey, room_center)),
    retract(at(monkey, room_left)).
climb_on_box(monkey) :-
    at(monkey, room_left),
    at(box, room_left),
    not(has(bananas, monkey)),
    assert(on(floor, box)),
    assert(at(monkey, box)),
    retract(at(monkey, room_left)).
push_box(monkey, room_left, room_center) :-
    at(monkey, room_left),
    at(box, room_left),
    not(has(bananas, monkey)),
    assert(at(monkey, room_center)),
    assert(at(box, room_center)),
    retract(at(monkey, room_left)),
    retract(at(box, room_left)).
goal_state(S) :-
    has(bananas, S).
plan(S, S, []) :- goal_state(S).
plan(S, Sfinal, [Action | RestOfPlan]) :-
    select_move(Action, S, S1),
    plan(S1, Sfinal, RestOfPlan).
select_move(Action, S, S1) :-
    call(Action),
    is_allowed(Action, S),
    copy_term(S, S1).
is_allowed(move(monkey, From, To), S) :-
    at(monkey, From, S),
    at(chair, To, S).
is_allowed(move(monkey, From, To), S) :-
    at(monkey, From, S),
    at(box, To, S).
is_allowed(climb_on_box(monkey), S) :-
    at(monkey, room_left, S),
    at(box, room_left, S).
is_allowed(push_box(monkey, From, To), S) :-
    at(monkey, From, S),
    at(box, From, S),
    at(chair, To, S).
