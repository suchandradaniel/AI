planet(mercury, 1, terrestrial, 0, 4879).
planet(venus,   2, terrestrial, 0, 12104).
planet(earth,   3, terrestrial, 1, 12742).
planet(mars,    4, terrestrial, 2, 6779).
planet(jupiter, 5, gas_giant,   79, 139820).
planet(saturn,  6, gas_giant,   83, 116460).
planet(uranus,  7, ice_giant,   27, 50724).
planet(neptune, 8, ice_giant,   14, 49244).

inner_planet(Name) :-
    planet(Name, Order, _, _, _),
    Order =< 4.

outer_planet(Name) :-
    planet(Name, Order, _, _, _),
    Order >= 5.

has_more_moons_than(Name, N) :-
    planet(Name, _, _, Moons, _),
    Moons > N.
