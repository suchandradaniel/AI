from collections import deque

def water_jug(x, y, target):
    # x, y are jug capacities
    visited = set()
    q = deque([(0, 0)])   # start with both jugs empty

    while q:
        a, b = q.popleft()
        if a == target or b == target:
            print(f"Reached: {a}, {b}")
            return
        if (a, b) in visited:
            continue
        visited.add((a, b))

        # Possible moves
        q.append((x, b))        # Fill jug X
        q.append((a, y))        # Fill jug Y
        q.append((0, b))        # Empty jug X
        q.append((a, 0))        # Empty jug Y

        # Pour X -> Y
        pour = min(a, y - b)
        q.append((a - pour, b + pour))

        # Pour Y -> X
        pour = min(b, x - a)
        q.append((a + pour, b - pour))

    print("No solution")

# Example: 3L and 5L jugs, target = 4
water_jug(3, 5, 4)
