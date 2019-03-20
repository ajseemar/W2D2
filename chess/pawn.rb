require_relative "piece"

class Pawn < Piece
  attr_reader :color
  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def symbol
    color == :black ? "♟" : "♙"
  end
end