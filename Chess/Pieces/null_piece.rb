require_relative "piece"
require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    
  end

  def color
    :N
  end
  
  def moves
    arr = []
  end

  def symbol
    :N
  end
end