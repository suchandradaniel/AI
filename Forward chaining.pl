% --- Knowledge Base ---

% Facts (initial knowledge)
fact(sunny).
fact(have_money).

% Rules (if conditions are satisfied, then conclusion can be added)
rule([sunny, have_money], go_beach).
rule([rainy], take_umbrella).
rule([hungry, have_money], eat_food).
rule([eat_food], happy).
rule([go_beach], happy).

% --- Forward Chaining Engine ---

% Start forward chaining with known facts
forward_chaining :-
    findall(F, fact(F), Facts),
    fc(Facts, []).

% Base case: no new facts can be inferred
fc([], _) :- !.
fc([F|Rest], Processed) :-
    (   member(F, Processed) ->
        fc(Rest, Processed)          % already processed fact
    ;   write('New fact derived: '), write(F), nl,
        infer_new_facts(F, NewFacts),
        append(Rest, NewFacts, UpdatedQueue),
        fc(UpdatedQueue, [F|Processed])
    ).

% Infer new facts using rules
infer_new_facts(F, NewFacts) :-
    findall(Conclusion,
            (rule(Conditions, Conclusion),
             member(F, Conditions),
             all_conditions_true(Conditions)),
            Derived),
    exclude(fact, Derived, NewDerived),   % avoid duplicates
    add_new_facts(NewDerived),
    NewFacts = NewDerived.

% Check if all conditions of a rule are satisfied
all_conditions_true([]).
all_conditions_true([H|T]) :-
    fact(H),
    all_conditions_true(T).

% Add new facts to knowledge base dynamically
add_new_facts([]).
add_new_facts([F|Rest]) :-
    (   fact(F) -> true      % already known
    ;   assertz(fact(F))     % add new fact
    ),
    add_new_facts(Rest).
