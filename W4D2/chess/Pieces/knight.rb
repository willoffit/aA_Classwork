require "require_all"
require_relative "../Modules/stepable"
require_relative "piece"

class Knight < Piece
  include Stepable

  def symbol
    return :♞ if @color == :black
    :♘ if @color == :white
  end

  def move_diffs
    [[1, 2], [2, 1], [-1, 2], [-2, 1,], [1, -2], [-1, -2], [2, -1], [-2, -1]]
  end
end