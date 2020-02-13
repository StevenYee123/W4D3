require_relative "piece"

class Pawn < Piece

  def initialize(color, board, pos)
    super
  end
  
  def symbol
    :P
  end

  def moves 
    # debugger
    forward_steps
  end


  private 

  def forward_dir 
    if @color == "white"
      1
    else 
      -1 
    end 
  end

  def at_start_row?
    (color == "white" && pos[0] == 1) || (color == "black" && pos[0] == 6)
  end

  def forward_steps 
    row, col = @pos 
    arr = []
     debugger
    if at_start_row?
      arr << [forward_dir + row, col] if @board[[forward_dir + row, col]].is_a?(NullPiece) 
      arr << [(forward_dir * 2) + row, col] if @board[[forward_dir * 2 + row, col]].is_a?(NullPiece)
    end
    debugger
    arr += side_attacks 
    arr
  end

  def side_attacks 
    arr = []
    row, col = @pos
    diag_up_left = [row - 1, col - 1] 
    diag_up_right = [row - 1, col + 1]
    diag_down_left = [row + 1, col - 1]
    diag_down_right = [row + 1, col + 1]

    if color == "white"
      arr << [-1, -1] if board[diag_up_left].is_a?(NullPiece) && !board[[forward_dir, 0]].nil?
      arr << [-1, 1] if board[diag_up_right].is_a?(NullPiece) && !board[[forward_dir, 0]].nil?
    else
      arr << [1, -1] if board[diag_down_left].is_a?(NullPiece) && !board[[forward_dir, 0]].nil?
      arr << [1, 1] if board[diag_down_right].is_a?(NullPiece) && !board[[forward_dir, 0]].nil?
    end
    debugger
    arr
  end


end