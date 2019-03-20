require_relative "piece"
require_relative "slideable"

class Bishop < Piece
  include Slideable

  attr_reader :color

  def initialize(board, pos, color)
    super(board, pos, color)
  end

  def symbol
    color == :black ? "♝" : "♗"
  end

  def move_dirs
    dirs = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
    moves = []
    dirs.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir.first, dir.last)
    end
    moves
  end
end