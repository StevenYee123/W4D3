require_relative "piece"
require_relative "../stepable"

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end

  def symbol
    :K
  end

  protected

  def move_diffs
    arr = [
      [-1,-1],
      [-1, 0],
      [-1, 1],
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1], 
      [0, -1]
    ]
  end

end