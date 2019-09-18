class TicTacToe

attr_accessor :board

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def valid_move?
  index.between?(0, 8) && !position_taken?(input.to_i-1)
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
  end
end

def full?
  board.all? { |token| token == 'X' || token == 'O' }
end

def draw?
  !won?(board) && full?(board)
end

def over?
  won? || draw?
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn
  display_board
  puts 'Please enter 1-9:'
  user_input = gets.strip
  if !valid_move?(input)
    turn
  end
  move(input, current_player)
  display_board
end

def position_taken?
  board[index] == 'X' || board[index] == 'O'
end

def current_player
  turn_count(board).even? ? 'X' : 'O'
end

def turn_count
  board.count { |token| token == 'X' || token == 'O' }
end

def move(location, token)
  @board[location.to_i-1] = token
end

def winner
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

end
