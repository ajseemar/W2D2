module Slideable

  # HORIZONTAL_DIRS = []
  # DIAGONAL_DIRS = []

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves

  end

  def move_dirs

  end

  # protected
  def grow_unblocked_moves_in_dir(dx, dy)
    dirs = []
    current_pos = [@pos[0] + dx, @pos[1] + dy]
    while @board.valid_pos?(current_pos, color)
      dirs << current_pos
      current_pos = [current_pos[0] + dx, current_pos[1] + dy]
      if @board[current_pos].class != NullPiece && @board[current_pos].color != color
        dirs << current_pos
        break
      end
    end
    dirs
  end

end