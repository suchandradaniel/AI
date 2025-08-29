% --- Monkey and Banana Problem in Prolog ---

% State Representation:
% state(MonkeyPosition, BoxPosition, MonkeyStatus, HasBanana)
% MonkeyStatus = onfloor / onbox
% HasBanana = has / hasnot

% Initial State:
% Monkey at door, box at window, monkey on floor, no banana
initial_state(state(atdoor, atwindow, onfloor, hasnot)).

% Goal State:
goal_state(state(_, _, _, has)).

% --- Actions ---

% 1. Monkey walks from one place to another
move(state(MP, BP, onfloor, HB),
     walk(MP, NP),
     state(NP, BP, onfloor, HB)).

% 2. Monkey pushes the box
move(state(MP, MP, onfloor, HB),
     push(MP, NP),
     state(NP, NP, onfloor, HB)).

% 3. Monkey climbs on the box
move(state(MP, MP, onfloor, HB),
     climb,
     state(MP, MP, onbox, HB)).

% 4. Monkey climbs down from the box
move(state(MP, MP, onbox, HB),
     climbdown,
     state(MP, MP, onfloor, HB)).

% 5. Monkey takes banana (only possible if on box at middle)
move(state(middle, middle, onbox, hasnot),
     take,
     state(middle, middle, onbox, has)).

% --- Plan Finder (DFS) ---

plan(State, []) :- goal_state(Sta_
