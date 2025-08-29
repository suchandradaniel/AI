% towers_of_hanoi(N, Source, Destination, Auxiliary).
% Moves N disks from Source peg to Destination peg using Auxiliary peg.

towers_of_hanoi(1, Source, Destination, _) :-
    write('Move disk from '), write(Source), write(' to '), write(Destination), nl.

towers_of_hanoi(N, Source, Destination, Auxiliary) :-
    N > 1,
    M is N - 1,
    towers_of_hanoi(M, Source, Auxiliary, Destination),
    towers_of_hanoi(1, Source, Destination, _),
    towers_of_hanoi(M, Auxiliary, Destination, Source).
