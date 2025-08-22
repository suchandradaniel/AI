def is_valid(graph, colors, node, c):
    return all(colors.get(n) != c for n in graph[node])

def color_map(graph, nodes, colors, idx=0):
    if idx == len(nodes): return colors
    node = nodes[idx]
    for c in ["Red","Green","Blue"]:
        if is_valid(graph, colors, node, c):
            colors[node] = c
            if color_map(graph, nodes, colors, idx+1): return colors
            del colors[node]
    return None

graph = {
    "WA":["NT","SA"], "NT":["WA","SA","Q"], "SA":["WA","NT","Q","NSW","V"],
    "Q":["NT","SA","NSW"], "NSW":["Q","SA","V"], "V":["SA","NSW"], "T":[]
}

print(color_map(graph, list(graph.keys()), {}))
