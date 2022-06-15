from studentA import new_board, print_board, is_game_over
from studentB import ai_move, get_user_move, is_player_starting

import numpy as np

board = new_board()

# board[0][0] = 2
# board[1][1] = 2
# board[2][2] = 2
# print_board(board)
# is_game_over(board)
players_move = is_player_starting()
while not is_game_over(board):
    print_board(board)
    board = np.logical_or(np.logical_and(players_move, get_user_move(board)), ai_move(board))
    players_move = not players_move

