require_relative "piece"
require_relative "../Modules/stepable"

class King < Piece
  include Stepable

  def symbol
   return :♚ if @color == :black
    :♔ if @color == :white
  end

  def move_diffs
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
end