require_relative "./Pieces/null_piece"
require_relative "./Pieces/piece"
require_relative "./Pieces/bishop"
require_relative "./Pieces/king"
require_relative "./Pieces/knight"
require_relative "./Pieces/queen"
require_relative "./Pieces/rook"
require_relative "./Pieces/pawn"
 
class NoPieceError < StandardError

end

class Board 
  def initialize
    @sentinel = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) { @sentinel}}
    starting_pos
  end

  def print 
    p @rows
  end

  def move_piece(start_pos, end_pos)
  
    if self[start_pos] == nil
      raise NoPieceError.new("There is no piece here!")
    end

    if !valid_pos?(start_pos) && !valid_pos?(end_pos)
      raise NoMethodError.new("Invalid Positions!")
    end

    unless self[start_pos].moves.include?(end_pos)
      raise NoMethodError.new("Can't move there!")
    else 
      piece = self[start_pos]
      self[end_pos] = piece
    end
  end

  def starting_pos
    rows = [0, 1, 6, 7]
    rows.each do |row|
      (0..7).each do |col|
        color = "white" if row == 0 || row == 1
        color = "black" if row == 6 || row == 7
        case row
        when 0
          popu_nonpawn(color, row, col)
        when 1
          popu_pawns(color, row, col)
        when 6
          popu_pawns(color, row, col)
        when 7
          popu_nonpawn(color, row, col)
        end
      end
    end
  end

  def popu_pawns(color, row, col)
    @rows[row][col] = Pawn.new(color, self, [row, col])
  end

  def popu_nonpawn(color, row, col)
    if col == 0 || col == 7
      @rows[row][col] = Rook.new(color, self, [row, col])
    elsif col == 1 || col == 6
      @rows[row][col] = Bishop.new(color, self, [row, col])
    elsif col == 2 || col == 5
      @rows[row][col] = Knight.new(color, self, [row, col])
    elsif col == 3
      @rows[row][col] = Queen.new(color, self, [row, col])
    else
      @rows[row][col] = King.new(color, self, [row, col])
    end
  end

  def [](pos)
    row, col = pos 
    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    @rows[row][col] = val 
  end

  def valid_pos?(pos)
    rows, col = pos 
    return false if rows < 0 || rows > 7
    return false if col  < 0 || col > 7

    true
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end
end


  
if __FILE__ == $PROGRAM_NAME 
  b1 = Board.new 
  # b1.print
  start_pos = [6,0]
  end_pos = [5,0]
  b1.move_piece(start_pos, end_pos)
end