pattern_match([], _).

pattern_match([X|Xs], [X|Ys]) :-
    prefix_match(Xs, Ys).

pattern_match(Pattern, [_|Ys]) :-
    pattern_match(Pattern, Ys).

prefix_match([], _).
prefix_match([X|Xs], [X|Ys]) :-
    prefix_match(Xs, Ys).
