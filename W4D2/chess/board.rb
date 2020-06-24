require_relative 'piece'
require_relative 'null_piece'

class NoPieceError < StandardError
    p "there is no piece at starting position"
end

class CannotMoveError < StandardErrorCannotMoveError
end


class Board
  def initialize()
    @grid = Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    populate
  end

  def populate
    (0...@grid.length).each do |row|
        (0...@grid.length).each do |col|
            pos = [row, col]
            if (0..1).include?(row)
                @grid[row][col] = Piece.new(:white, self, pos)
            elsif (6..7).include?(row)
                @grid[row][col] = Piece.new(:black, self, pos)
            else
                @grid[row][col] = @sentinel
            end
        end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError if start_pos = @sentinel
    raise CannotMoveError
    starting_piece = self[start_pos]
    self[end_pos] = starting_piece
    self[start_pos] = @sentinel
    starting_piece.position = end_pos
  end



end

