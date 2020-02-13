require_relative "../slideable"
require_relative "piece"

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super
    # @color = color
    # @board = board 
    # @pos = pos
  end

  def symbol
    :B
  end
  
  protected

  def move_dirs
    diagonal_dirs
  end
end