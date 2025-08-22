from itertools import permutations

def tsp(graph, start=0):
    n = len(graph)
    nodes = [i for i in range(n) if i != start]
    best_cost = float("inf")
    best_path = []

    for perm in permutations(nodes):
        path = [start] + list(perm) + [start]
        cost = sum(graph[path[i]][path[i+1]] for i in range(len(path)-1))
        if cost < best_cost:
            best_cost, best_path = cost, path

    return best_cost, best_path

# Example
graph = [
    [0, 29, 20, 21],
    [29, 0, 15, 17],
    [20, 15, 0, 28],
    [21, 17, 28, 0]
]

print(tsp(graph))
