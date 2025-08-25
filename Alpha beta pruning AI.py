def alphabeta(depth, idx, maxPlayer, scores, alpha, beta):
    if depth == 3:   # leaf node
        return scores[idx]

    if maxPlayer:
        val = float('-inf')
        for i in range(2):
            val = max(val, alphabeta(depth+1, idx*2+i, False, scores, alpha, beta))
            alpha = max(alpha, val)
            if alpha >= beta: break
        return val
    else:
        val = float('inf')
        for i in range(2):
            val = min(val, alphabeta(depth+1, idx*2+i, True, scores, alpha, beta))
            beta = min(beta, val)
            if beta <= alpha: break
        return val

scores = [3, 5, 6, 9, 1, 2, 0, -1]  # leaf nodes
print("Optimal value:", alphabeta(0, 0, True, scores, float('-inf'), float('inf')))
