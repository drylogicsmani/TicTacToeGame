require_relative 'position'
require 'byebug'
class TicTacToe

  def initialize(first_player, second_player)
    raise "Tokens cannot be the same." if first_player == second_player
    @first_player = first_player
    @second_player = second_player
    @board = Array.new(3) { Array.new(3) }
  end

  attr_accessor :first_player, :second_player, :board , :previous_token, :token

  def place(token, position)
    # position_is_empty?(position)
    if board[position[:x]][position[:y]] == nil
      raise "same token repeated" if @previous_token == token 
      board[position[:x]][position[:y]] = token
      @previous_token = token
    elsif board[position[:x]][position[:y]] != nil
      raise "This cell is already occupaied"
    end
  end 

  def is_empty?
    board_status = board.flatten.any?
  end
                                          
  # def position_is_empty?(position)
  #   byebug
  #   position = []
  #   position << board[position[:x]][position[:y]]
  #   raise 'This position is already filled' if position.any? == true
  # end

  def horizontal_order_winning
    horizontal = []
    for i in 0..2
      for j in 0..2
        horizontal << board[i][j]
      end
      if horizontal.uniq.length == 1
        token =  "#{horizontal.first}winning"
      end
      horizontal
      horizontal.clear
    end
    token
  end

  def vertical_order_winning
    transpose_board = board.transpose
    vertical = []
    for i in 0..2
      for j in 0..2
        vertical << transpose_board[i][j]
      end
      if vertical.uniq.length == 1
        token =  "#{vertical.first}winning"
      end
      vertical
      vertical.clear
    end
    token
  end
  
end