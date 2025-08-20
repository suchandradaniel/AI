from collections import deque

def valid(m, c):
    return 0 <= m <= 3 and 0 <= c <= 3 and (m == 0 or m >= c) and (3-m == 0 or 3-m >= 3-c)

def mc():
    start, goal = (3,3,1), (0,0,0)
    q = deque([(start, [start])])
    seen = {start}
    moves = [(1,0),(2,0),(0,1),(0,2),(1,1)]  # boat options

    while q:
        (m,c,b), path = q.popleft()
        if (m,c,b) == goal:
            return path
        d = -1 if b else 1
        for dm,dc in moves:
            nm, nc, nb = m+d*dm, c+d*dc, 1-b
            nxt = (nm,nc,nb)
            if valid(nm,nc) and nxt not in seen:
                seen.add(nxt)
                q.append((nxt, path+[nxt]))

sol = mc()
for i, s in enumerate(sol):
    print(f"Step {i}: {s}")
