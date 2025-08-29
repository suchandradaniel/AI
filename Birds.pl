% Knowledge Base

% Facts: bird(Name).
bird(sparrow).
bird(pigeon).
bird(crow).
bird(parrot).
bird(owl).
bird(penguin).
bird(ostrich).

% Facts: cannot_fly(Name).
cannot_fly(penguin).
cannot_fly(ostrich).

% Rule: A bird can fly if it is a bird and not in cannot_fly list
can_fly(X) :-
    bird(X),
    \+ cannot_fly(X).

% Rule: A bird cannot fly if it is listed in cannot_fly
cannot_fly_bird(X) :-
    bird(X),
    cannot_fly(X).
