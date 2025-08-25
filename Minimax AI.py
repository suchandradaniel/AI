def minimax(depth, isMaximizing):
    # Example evaluation values for leaf nodes
    scores = [3, 5, 2, 9, 12, 5, 23, 23]

    # If we reached leaf node
    if depth >= len(scores) // 2:
        return scores[depth - (len(scores)//2)]

    if isMaximizing:
        return max(minimax(depth*2, False), minimax(depth*2+1, False))
    else:
        return min(minimax(depth*2, True), minimax(depth*2+1, True))

print("Optimal value:", minimax(1, True))
