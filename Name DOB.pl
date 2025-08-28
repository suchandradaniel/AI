dob(john, 12, march, 1998).
dob(susan, 5, july, 2000).
dob(michael, 23, december, 1995).
dob(alice, 1, january, 2002).
dob(david, 14, february, 1999).

show_dob(Name) :-
    dob(Name, Day, Month, Year),
    format('~w was born on ~w ~w, ~w.~n', [Name, Day, Month, Year]).
