class Piece
    attr_accessor :position, :color
    attr_reader :board
  def initialize(color, board, position)
    @color, @board, @position = color, board, position
  end

  def inspect
    "#<Type: #{self.to_s} Position: #{position} Color: #{color}>"
  end

  def moves
    
  end

  def to_s
    self.symbol.to_s
  end

  def valid_moves

  end

  def empty?
    if self.board[self.position] == self.board.sentinel
      return true
    end

    false
  end

  def pos=(val)
    self.board[self.position] = val
  end

  def symbol

  end

  private

  def move_into_check?(end_pos)

  end
end