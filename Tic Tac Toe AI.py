board = [" "] * 9
def show(): print(f"{board[0]}|{board[1]}|{board[2]}\n-+-+-\n{board[3]}|{board[4]}|{board[5]}\n-+-+-\n{board[6]}|{board[7]}|{board[8]}")

def win(p):
    combos = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
    return any(board[a]==board[b]==board[c]==p for a,b,c in combos)

player = "X"
for turn in range(9):
    show()
    move = int(input(f"Player {player} (0-8): "))
    if board[move] == " ":
        board[move] = player
        if win(player):
            show(); print(f"Player {player} wins!"); break
        player = "O" if player=="X" else "X"
    else: print("Invalid!"); turn -= 1
else:
    show(); print("It's a draw!")
