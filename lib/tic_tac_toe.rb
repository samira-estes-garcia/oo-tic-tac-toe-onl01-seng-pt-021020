class TicTacToe
  
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], #top row 
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #left diagonal
    [2,4,6] #right diagonal
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
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(index)
    @board[index] != " " ? true : false
  end
  
  def valid_move?(player_position)
    if player_position.between?(0,8) && !position_taken?(player_position)
      true
    else
      false
    end
  end
  
  def turn
    user_input = gets.strip
    player_position = input_to_index(user_input)
    if valid_move?(player_position)
      player_token = current_player
      move(player_position, player_token)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count{|index| index != " "}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
  WIN_COMBINATIONS.any? do |combo|
   if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
     return combo
   end
  end
  end
  
  def full?
    @board.all?{|index| index != " "}
  end
  
  def draw?
    full? && !won?
  end
  
  def over? 
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    if combo = won?
      @board[combo[0]]
    end
  end
  
  def play 
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
  
  
end