module Slideable

  def moves 
    arr = []
    move_dirs.each do |pos|
      row, col = pos
      arr += grow_unblocked_moves_in_dir(row, col)
    end
  end

    HORIZONTAL_DIRS = [
    [0,1],
    [1,0],
    [0,-1],
    [-1, 0]
  ]   

  DIAGONAL_DIRS = [
    [1,1],
    [-1, -1],
    [1, -1],
    [-1, 1]
  ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end 

  def diagonal_dirs
    DIAGONAL_DIRS
  end
private
#[0,0] + HORIZONTAL..[0]

  def move_dirs
    #The point of this method is that it changes based on the piece that calls it 
    #i.e...Rook calls Horizontal, where bishop calls Diagonal, and queen calls both
    raise "Configure Method!"
  end 

  def grow_unblocked_moves_in_dir(dx, dy)
    row, col = @pos 
    keep_going = true
    arr = []
    
    while keep_going
      if (row + dx > 7 || row + dx < 0) || (col + dy > 7 ||  col + dy < 0)
        false
      elsif !board[dx + row, col + dy].is_a?(NullPiece)
        keep_going = false 
      else
        arr << [row += dx, col += dy]
      end
    end

    arr
  end
end
