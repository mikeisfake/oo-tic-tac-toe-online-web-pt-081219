require 'pry'

class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
 
 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
 end 
 
 def input_to_index(input)
   input.to_i - 1
 end 
 
 def move(index, token = "X")
   @board[index] = token
 end 
 
 def position_taken?(index)
   @board[index] == " " ? false : true 
 end 
 
 def valid_move?(index)
   @board[index] == " " && index <= 9 ? true : false
 end 
 
 def turn_count
  @board.count{|token| token == "X" || token == "O"}
 end
 
 def current_player
   turn_count.even? ? "X" : "O"
 end
  
  def turn 
    puts "Enter a number from 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn 
    end 
  end
  

  def won?
    WIN_COMBINATIONS.each { |winner|
      position_1 = @board[winner[0]]
      position_2 = @board[winner[1]]
      position_3 = @board[winner[2]]
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return winner
      elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
        return winner 
      end 
      } 
    false 
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"} ? true : false 
  end 

  def draw?
    full? && !won? ? true : false 
  end 

  def over?
    won? || full? ? true : false 
  end 

  def winner
    test_arr = won? 
    if !won?
      return nil 
    else
      if @board[test_arr[0]] == "X"
        return "X"
      else 
        return "O"
      end 
    end 
  end 
  
  
  def play 
    until over?
      turn
      draw?
    end 
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 

  
end 