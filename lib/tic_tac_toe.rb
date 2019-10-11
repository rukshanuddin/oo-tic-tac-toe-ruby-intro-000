class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def board=(board)
  @board = board
end

def board
  @board
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(location, current_player)
  @board[location.to_i] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(position)
  position.to_i.between?(0,8) && !position_taken?(position.to_i)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  input = input_to_index(user_input)
  if valid_move?(input)
    move(input, current_player)
  else
    turn
  end
  display_board
end

def turn_count
  counter = 0
  @board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?

  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
end

def full?
  if @board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end

def draw?
  !won? && full?
end

def over?
  draw? || won?

end

def winner
  if win_combination = won?
    @board[win_combination.first]
  end
end

def play
  until over?
    current_player
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
end
