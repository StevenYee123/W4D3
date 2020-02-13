require "byebug"
module Stepable
  def moves
    row, col = @pos
    arr = []
    move_diffs.each do |pos|
      # debugger
      new_pos = [(pos[0] + row), (col + pos[-1])]
      if ((row + pos[0]) <= 7 && (row + pos[0]) >= 0) && ((col + pos[-1]) <= 7 && (col + pos[-1]) >= 0)
        if @board[new_pos].is_a?(NullPiece)
          arr << new_pos
        end
      end
    end 

    arr
  end

  private 

  def move_diffs 
    raise "Unconfigured class!"
  end

end