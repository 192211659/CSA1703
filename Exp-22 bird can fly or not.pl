can_fly(eagle).
can_fly(hawk).
can_fly(sparrow).
can_fly(penguin).
cannot_fly(ostrich).
cannot_fly(kiwi).
can_bird_fly(Bird) :-
    can_fly(Bird),
    write(Bird), write(' can fly.').
can_bird_fly(Bird) :-
    cannot_fly(Bird),
    write(Bird), write(' cannot fly.').
