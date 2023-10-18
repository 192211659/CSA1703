hanoi(N) :- move(N, left, center, right).
move(0, _, _, _) :- !.
move(N, Source, Auxiliary, Target) :-
    N > 0,
    M is N - 1,
    move(M, Source, Target, Auxiliary),
    write('Move disk '), write(N), write(' from '), write(Source),
    write(' to '), write(Target), nl,
    move(M, Auxiliary, Source, Target).
