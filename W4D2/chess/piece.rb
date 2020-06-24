class Piece
    attr_accessor :position
  def initialize(color, board, position)
    @color, @board, @position = color, board, position
  end
end