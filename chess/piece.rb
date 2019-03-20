require_relative "slideable"

class Piece
  include Slideable

  attr_reader :type
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_dirs

  end

  def moves

  end

end