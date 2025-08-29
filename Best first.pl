% --- Example Graph (with heuristic values) ---
% edge(Node, Neighbor, Cost).
edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 5).
edge(b, e, 3).
edge(c, f, 4).
edge(c, g, 6).
edge(e, h, 2).
edge(f, i, 1).

% heuristic(Node, Value).
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 2).
heuristic(d, 7).
heuristic(e, 3).
heuristic(f, 1).
heuristic(g, 6).
heuristic(h, 2).
heuristic(i, 0).   % Goal node

% --- Best First Search ---
best_first_search(Start, Goal, Path) :-
    heuristic(Start, H),
    search([(H, [Start])], Goal, RevPath),
    reverse(RevPath, Path).

% search(OpenList, Goal, Path)
search([(_, [Goal|RestPath])|_], Goal, [Goal|RestPath]).
search([(_, [Current|RestPath])|OtherPaths], Goal, Path) :-
    findall((H, [Next, Current|RestPath]),
            (edge(Current, Next, _), \+ member(Next, [Current|RestPath]), heuristic(Next, H)),
            NewPaths),
    append(OtherPaths, NewPaths, TempPaths),
    sort(TempPaths, SortedPaths),        % sort by heuristic
    search(SortedPaths, Goal, Path).
