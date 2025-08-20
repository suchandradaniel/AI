from collections import deque

GOAL = "123456780"   # 0 = blank

# Possible moves (up, down, left, right)
moves = {0:[1,3],1:[0,2,4],2:[1,5],
         3:[0,4,6],4:[1,3,5,7],5:[2,4,8],
         6:[3,7],7:[4,6,8],8:[5,7]}

def solve(start):
    start = "".join(str(x) for x in start)  # convert to string
    if start == GOAL:
        return ["Already solved!"]

    q = deque([(start, [])])
    visited = {start}

    while q:
        state, path = q.popleft()
        zero = state.index("0")
        for m in moves[zero]:
            s = list(state)
            s[zero], s[m] = s[m], s[zero]
            new = "".join(s)
            if new not in visited:
                if new == GOAL:
                    return path + [new]
                q.append((new, path+[new]))
                visited.add(new)
    return None

# Example start state
start_state = [1,2,3,4,0,6,7,5,8]

solution = solve(start_state)
if solution:
    print(f"Solved in {len(solution)} moves:")
    for step in solution:
        for i in range(0,9,3):
            print(step[i:i+3].replace("0","_"))
        print()
else:
    print("No solution found")
