from heapq import heappop, heappush

def astar(graph, h, start, goal):
    open_list = [(h[start], 0, start, [start])]  # (f, g, node, path)
    g_costs = {start: 0}  # best cost so far

    while open_list:
        f, g, node, path = heappop(open_list)

        if node == goal:
            return g, path  # found goal

        for neigh, cost in graph[node]:
            g_new = g + cost
            if neigh not in g_costs or g_new < g_costs[neigh]:
                g_costs[neigh] = g_new
                f_new = g_new + h[neigh]
                heappush(open_list, (f_new, g_new, neigh, path + [neigh]))
    return float("inf"), []  # no path found


# Example
graph = {
    'A':[('B',1),('C',3)], 'B':[('D',3),('E',1)], 'C':[('F',5)],
    'D':[('G',3)], 'E':[('G',1)], 'F':[('G',2)], 'G':[]
}
h = {'A':7,'B':6,'C':5,'D':4,'E':2,'F':3,'G':0}

print(astar(graph, h, 'A', 'G'))
