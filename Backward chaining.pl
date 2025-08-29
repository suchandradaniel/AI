% --- Knowledge Base ---

% Facts
fact(sunny).
fact(have_money).
fact(hungry).

% Rules (if conditions are satisfied, then conclusion is true)
rule(go_beach, [sunny, have_money]).
rule(take_umbrella, [rainy]).
rule(eat_food, [hungry, have_money]).
rule(happy, [eat_food]).
rule(happy, [go_beach]).

% --- Backward Chaining Engine ---

% Prove a goal using backward chaining
prove(Goal) :-
    fact(Goal),                                  % If it's a fact, succeed
    write('Proved fact: '), write(Goal), nl.

prove(Goal) :-
    rule(Goal, Conditions),                      % If it's a rule, check conditions
    prove_all(Conditions),
    write('Proved by rule: '), write(Goal), nl.

% Fail if neither fact nor rule proves the goal
prove(Goal) :-
    write('Cannot prove: '), write(Goal), nl,
    fail.

% Prove all conditions in a rule
prove_all([]).
prove_all([H|T]) :-
    prove(H),
    prove_all(T).
