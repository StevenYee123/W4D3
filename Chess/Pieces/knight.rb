require_relative "piece"
require_relative "../stepable"

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end
  
  def symbol
    :H
  end
  protected

  def move_diffs
    arr = [
      [-2, -1],
      [-2, 1],
      [-1, 2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2],
      [-1, -2]
    ]
  end

end