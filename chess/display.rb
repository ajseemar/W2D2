require "byebug"
require 'paint'
require_relative 'cursor'
require_relative 'board'

class Display
    
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render 
    system("clear")
    column_header
    letters = ("A".."H").to_a
    board.grid.each_with_index do |row, i1|
      print " #{letters[i1]}" 
      row.each_with_index do |col, i2|
        
        bg_c = generate_color(i1, i2)
        print Paint["#{col.symbol} ", nil, bg_c] if i2 < row.length - 1
        puts Paint["#{col.symbol} ", nil, bg_c] if i2 == row.length - 1

      end
    end
  end

  def generate_color(i1, i2)
    if [i1, i2] == cursor.cursor_pos && [i1, i2] != cursor.selected_pos
      :red
    elsif [i1, i2] == cursor.selected_pos
      :green
    elsif cursor.selected_pos && board[[cursor.selected_pos.first, cursor.selected_pos.last]].move_dirs.include?([i1, i2])
      :white
    elsif (i1.even? && i2.even?) || (i1.odd? && i2.odd?)
      :blue
    else
      :yellow
    end

  rescue
      debugger 
  end

  def column_header
    puts "  0 1 2 3 4 5 6 7"
  end

end

if __FILE__ == $PROGRAM_NAME
  d = Display.new(Board.new)
  while true
    d.render
    d.cursor.get_input
  end
  # d.cursor.update_pos([2,2])
  # d.render
  # d.cursor.update_pos([3,2])
  # d.render
end