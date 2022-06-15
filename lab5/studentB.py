import random

def is_player_starting():
    choice = random.choice([True, False])
    if choice:
        print("You starting the game")
    else:
        print("Ai starting the game")
    return choice

def get_user_move(board):
    while True:
        move_x = int(input("Choose column: "))
        move_y = int(input("Choose row: "))
        if board[move_x][move_y] == 0:
            board[move_x][move_y] = 1
            break
        else:
            print("You have choosen a occupied square")
    return board

def ai_move(board):
    while True:
        x = random.randint(0, len(board) - 1)
        y = random.randint(0, len(board) - 1)
        if board[x][y] == 0:
            board[x][y] = 2
            break
    return board