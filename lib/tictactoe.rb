require_relative 'position'
require 'byebug'
class TicTacToe

  def token(first_player, second_player)
    @first_player = first_player
    @second_player = second_player
  end
  

  def initialize(first_player, second_player)
    raise "Tokens cannot be the same." if first_player == second_player
    @first_player = first_player
    @second_player = second_player
    @board = Array.new(3) { Array.new }
  end

  attr_accessor :first_player, :second_player, :board

  def place(token, position)
    raise "same token repeated" if @previous_token == token 
    board[position[:x]][position[:y]] = token
    @previous_token = token
  end

  # def position(row, column)
  #   @x = row
  #   @y = column
  #   {x: @x, y: @y}
  # end
end