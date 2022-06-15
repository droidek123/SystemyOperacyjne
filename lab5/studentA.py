import numpy as np

def new_board(size=3):
    return np.zeros((size,size))


def print_board(board):
    for i in board:
        for j in i:
            if j == 0:
                print('_',end="")
            if j == 1:
                print('x',end="")
            if j == 2:
                print('o',end="")
        print("\n")

def is_game_over(board):
    
    temp = np.transpose(board)
    diagonal = np.diag(board)
    if np.all(diagonal == 1) or np.all(diagonal == 2):
        return True

    for (i,j) in zip(board, temp):
        if np.all(i == 1) or np.all(i == 2):
            return True
        elif np.all(j == 1) or np.all(j == 2):
            return True
    if np.any(board == 0):
        return False
    return True


