likes(ellen, reading).

likes(john, computers).
likes(john, badminton).
likes(john, photo).
likes(john, reading).

likes(leonard, badminton).

likes(eric, swimming).
likes(eric, reading).
likes(eric, chess).

likes(paul, swimming).

has_four_hobbies(X) :-
    findall(_, likes(X, Y), Hobbies),
    length(Hobbies, 4).

have_common_hobbies(X, Y) :- likes(X, Z), likes(Y, Z), X \== Y.