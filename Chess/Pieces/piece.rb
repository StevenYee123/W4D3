class Piece
  attr_reader :color, :board
  attr_accessor :pos  

  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos
  end

  def to_s 
    puts ""
  end

  def empty? 

  end

  def valid_moves
    
  end

  def pos=(val)
    pos = val 
  end

  def symbol

  end

  private

  def move_into_check?(end_pos)

  end
end