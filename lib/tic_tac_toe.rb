class TicTacToe
  
def initialize(board = nil)
  @board = board || Array.new(9," ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [8, 4, 0],
  [6, 4, 2],
  [0, 3, 6],
  [1, 4, 7],
  [8, 5, 2]
  ]
  
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  
def input_to_index(user_input)
  user_input.to_i - 1
end  


def move(input_to_index, player_token)
   @board[input_to_index] = player_token
end

def position_taken?(position)
if @board[position] == " " 
  return @board[position] != " "
  elsif @board[position] == ""
  return @board[position] != ""
  elsif @board[position] == nil
  return @board[position] != nil
  elsif @board[position] == "X"
  return @board[position] == "X"
  elsif @board[position] == "O"
  return @board[position] == "O"
end
end

def valid_move?(position)
 if !position_taken?(position) && position <= 8 && position >= 0
   return true
end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  player_token = current_player

    if valid_move?(position)
      move(position, player_token)
      puts display_board
    else
      puts "Please enter 1-9:"
      turn
      
    end 
end

def turn_count

turns = 0

while turns <= 9

@board.each do |position|
  if position == "X" || position == "O"
  turns += 1

end
end
return turns
end
end


def current_player
  if turn_count % 2 == 0 
    return "X"
  else return "O"
end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
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
    end
  end
  false
end

def full?
  @board.none?{|space| space == " "}
end

def draw?
  if won? == false && full? == true 
    return true
  else false
  end
end

def over?
  if won? || full? || draw?
    return true
  else
    return false
  end
end
    
def winner
  
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    elsif won? == false
    return nil
    end
  end
end

def play
  until over?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

  
end