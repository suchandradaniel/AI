% --- Facts: family relationships ---

% Male members
male(john).
male(paul).
male(mike).
male(david).
male(alex).

% Female members
female(mary).
female(linda).
female(susan).
female(kate).
female(emma).

% Parent relationships
parent(john, paul).
parent(mary, paul).
parent(john, linda).
parent(mary, linda).

parent(paul, mike).
parent(susan, mike).
parent(paul, kate).
parent(susan, kate).

parent(linda, david).
parent(alex, david).
parent(linda, emma).
parent(alex, emma).

% --- Rules: relationships ---

% father(X,Y) :- X is the father of Y
father(X, Y) :-
    male(X), parent(X, Y).

% mother(X,Y) :- X is the mother of Y
mother(X, Y) :-
    female(X), parent(X, Y).

% sibling(X,Y) :- X and Y have the same parent and are not the same person
sibling(X, Y) :-
    parent(Z, X), parent(Z, Y), X \= Y.

% grandfather(X,Y) :- X is the grandfather of Y
grandfather(X, Y) :-
    male(X), parent(X, Z), parent(Z, Y).

% grandmother(X,Y) :- X is the grandmother of Y
grandmother(X, Y) :-
    female(X), parent(X, Z), parent(Z, Y).

% ancestor(X,Y) :- X is an ancestor of Y
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z), ancestor(Z, Y).
