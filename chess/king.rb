require_relative "piece"

class King < Piece
  attr_reader :color
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def symbol
    color == :black ? "♚" : "♔"
  end
end