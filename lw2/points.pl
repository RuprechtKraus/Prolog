% Горизонтальные
seg(1, point(1, 11), point(14, 11)).
seg(2, point(2, 4), point(13, 4)).
seg(3, point(2, 2), point(9, 2)).
seg(5, point(7, 10), point(13, 10)).

% Вертикальные
seg(4, point(3, 1), point(3, 10)).
seg(6, point(8, 0), point(8, 13)).
seg(7, point(10, 3), point(10, 12)).
seg(8, point(11, 3), point(11, 13)).
seg(9, point(12, 2), point(12, 12)).

horiz(N) :- seg(N, point(X1, Y1), point(X2, Y2)), X1 < X2, Y1 =:= Y2.
vertical(N) :- seg(N, point(X1, Y1), point(X2, Y2)), Y1 < Y2, X1 =:= X2.

seg_len(point(X1, Y1), point(X2, Y2), Length) :-
    Length is sqrt((X2 - X1) ** 2 + (Y2 - Y1) ** 2).

% N - горизонтальный сегмен, M - вертикальный сегмент
cross(N, M, point(X, Y), NL, ML) :-
    seg(N, point(X1, Y1), point(X2, Y2)),
    seg(M, point(X3, Y3), point(X4, Y4)),
    Y1 =:= Y2, X1 < X2, X3 =:= X4, Y3 < Y4, % Первый сегмент горизонтальные, а второй вертикальный
    X1 =< X4, X2 >= X4, Y3 =< Y1, Y4 >= Y1, % Проверка на пересечение
    X is X3,
    Y is Y1,
    seg_len(point(X1, Y1), point(X2, Y2), NL), 
    seg_len(point(X3, Y3), point(X4, Y4), ML).
    % NL is sqrt((X2 - X1) ** 2 + (Y2 - Y1) ** 2), % Длина первого сегмента
    % ML is sqrt((X4 - X3) ** 2 + (Y4 - Y3) ** 2). % Длина второго сегмента

per_sq(A, B, C, D, P, S) :-
    cross(A, B, point(X1, Y1), _, _),
    cross(A, D, point(X2, Y2), _, _),
    cross(C, B, point(X3, Y3), _, _),
    cross(C, D, point(X4, Y4), _, _),
    A < C, B < D, % Избегем дубликатов
    seg_len(point(X1, Y1), point(X2, Y2), L1),
    seg_len(point(X1, Y1), point(X3, Y3), L2),
    seg_len(point(X2, Y2), point(X4, Y4), L3),
    seg_len(point(X3, Y3), point(X4, Y4), L4),
    P is L1 + L2 + L3 + L4,
    S is L1 * L3.