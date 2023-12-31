def print_board(board):
    for row in board:
        print(" | ".join(row))
        print("-" * 9)
def check_winner(board):
    for row in board + list(zip(*board)):
        if all(cell == row[0] and cell != " " for cell in row):
            return True
    if all(board[i][i] == board[0][0] and board[i][i] != " " for i in range(3)) or \
       all(board[i][2 - i] == board[0][2] and board[i][2 - i] != " " for i in range(3)):
        return True
    return False
def play_game():
    board = [[" " for _ in range(3)] for _ in range(3)]
    player = "X"
    while any(" " in row for row in board):
        print_board(board)
        row, col = map(int, input(f"Player {player}, enter row and column (e.g., 1 1): ").split())
        if board[row - 1][col - 1] == " ":
            board[row - 1][col - 1] = player
            if check_winner(board):
                print_board(board)
                print(f"Player {player} wins!")
                return
            player = "O" if player == "X" else "X"
        else:
            print("Cell already taken. Try again.")
    print_board(board)
    print("It's a draw!")
if __name__ == "__main__":
    play_game()
