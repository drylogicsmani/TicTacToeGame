require_relative 'position.rb'
class TicTacToe
  
  def initialize(first_player, second_player, row_columns)
    raise "tokens are same" if first_player == second_player
    @first_player = first_player
    @second_player = second_player
    @board = Array.new(row_columns) { Array.new }
  end


  def place(token, position)
    raise "same token repeated" if previous_token == token 
    board[position.x][position.y] = token
    previous_token = token
  end
end