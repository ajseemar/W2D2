require_relative "piece"
require_relative "pawn"
require_relative "knight"
require_relative "bishop"
require_relative "rook"
require_relative "queen"
require_relative "king"
require_relative "null_piece"

class Board 

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end

  def [](pos) #[1, 2]
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate_board
    # pawns
    # (0..7).each { |n| @grid[1][n] = Pawn.new(:white_pawn, [1, n], :white) }
    (0..7).each { |n| @grid[1][n] = NullPiece.instance }
    # (0..7).each { |n| @grid[6][n] = Pawn.new(:black_pawn, [6, n], :black) }
    (0..7).each { |n| @grid[6][n] = NullPiece.instance }
    
    # main pieces
    piece_order = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    set_player_ones_pieces(piece_order)
    set_player_twos_pieces(piece_order)

    # null pieces
    (2..5).each do |i|
      (0..7).each do |j|
        self[[i, j]] = NullPiece.instance
      end
    end
  end

  def set_player_ones_pieces(arr)
    arr.each_with_index do |piece, idx|
      @grid[0][idx] = piece.new(self, [0, idx], :white)
    end
  end

  def set_player_twos_pieces(arr)
    arr.each_with_index do |piece, idx|
      @grid[7][idx] = piece.new(self, [7, idx], :black)
    end
  end

  def move_piece(start_pos, end_pos)
    current_piece = self[start_pos]
    # raise if NullPiece === current_piece || self[end_pos].class != NullPiece 
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def valid_pos?(pos, current_color)
    return false unless pos.first.between?(0, 7)
    return false unless pos.last.between?(0, 7)
    return false if self[pos].class != NullPiece && self[pos].color == current_color
    true
  end

  def inbounds?(pos)
    return false unless pos.first.between?(0, 7)
    return false unless pos.last.between?(0, 7)
    true
  end

end