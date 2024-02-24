male(bill).
male(joe).
male(paul).
male(jim).
male(bob).

female(sue).
female(mary).
female(ann).
female(tammy).

parent(bill, joe).
parent(bill, ann).
parent(sue, joe).
parent(sue, ann).
parent(paul, jim).
parent(mary, jim).
parent(joe, tammy).
parent(ann, bob).
parent(jim, bob).

grandmother(X, Y) :- female(X), parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), parent(X, Z), parent(Z, Y).

grandson(X, Y) :- male(X), parent(Z, X), parent(Y, Z).
granddaughter(X, Y) :- female(X), parent(Z, X), parent(Y, Z).

sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), X \== Y.
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \== Y.
sibling(X, Y) :- sister(X, Y); brother(X, Y).

aunt(X, Y) :- sister(X, Z), parent(Z, Y).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

cousin(X, Y) :- parent(Z, X), sibling(Z, N), parent(N, Y).