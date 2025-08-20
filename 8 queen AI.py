N = 8

def print_board(board):
    for row in board:
        print(" ".join("Q" if col else "." for col in row))
    print("\n")

def is_safe(board, row, col):
    # Check this row on the left
    for i in range(col):
        if board[row][i]:
            return False

    # Check upper diagonal on left
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j]:
            return False

    # Check lower diagonal on left
    for i, j in zip(range(row, N, 1), range(col, -1, -1)):
        if board[i][j]:
            return False

    return True

def solve(board, col):
    if col >= N:
        print_board(board)
        return True  # Print one solution (change to False if want all solutions)

    res = False
    for i in range(N):
        if is_safe(board, i, col):
            board[i][col] = 1
            res = solve(board, col + 1) or res
            board[i][col] = 0  # backtrack
    return res

def solve_n_queens():
    board = [[0] * N for _ in range(N)]
    if not solve(board, 0):
        print("No solution exists")

# Run program
solve_n_queens()
