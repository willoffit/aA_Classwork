# require "require_all"
# require_all '../Pieces'

require_relative "../Pieces/piece"
require_relative "../Pieces/pawn"
require_relative "../Pieces/knight"
require_relative "../Pieces/king"
require_relative "../Pieces/queen"
require_relative "../Pieces/rook"
require_relative "../Pieces/null_piece"
require_relative "../Pieces/bishop"


class NoPieceError < StandardError
    def message 
      "there is no piece at starting position"
    end
end

class CannotMoveError < StandardError

  def message
    "The piece cannot move to the end position"
  end
end

class InvalidPositionError < StandardError
  def message
    "The position needs to be between 0 and 7."
  end
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
            if row == 1
               self[pos] = Pawn.new(:black, self, pos)
            elsif row == 0 && col == 0 || row == 0 && col == 7
              self[pos] = Rook.new(:black, self, pos)
            elsif row == 0 && col == 1 || row == 0 && col == 6
              self[pos] = Knight.new(:black, self, pos)
            elsif row == 0 && col == 2 || row == 0 && col == 5
              self[pos] = Bishop.new(:black, self, pos)
            elsif row == 6
              self[pos] = Pawn.new(:white, self, pos)
            elsif row == 7 && col == 0 || row == 7 && col == 7
              self[pos] = Rook.new(:white, self, pos)
            elsif row == 7 && col == 1 || row == 7 && col == 6
              self[pos] = Knight.new(:white, self, pos)
            elsif row == 7 && col == 2 || row == 7 && col == 5
              self[pos] = Bishop.new(:white, self, pos)
            else
              self[pos] = @sentinel
            end
        end
    end
        self[[0, 3]] = Queen.new(:black, self, [0, 3])
        self[[0, 4]] = King.new(:black, self, [0, 4])
        self[[7, 3]] = Queen.new(:white, self, [6, 3])
        self[[7, 4]] = King.new(:white, self, [6, 4])
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
    valid_position?(start_pos) && valid_position?(end_pos)
    raise NoPieceError if self[start_pos] == @sentinel
    raise CannotMoveError unless self[end_pos] == @sentinel
    starting_piece = self[start_pos]
    self[end_pos] = starting_piece
    self[start_pos] = @sentinel
    starting_piece.position = end_pos
  end

  def valid_position?(pos)
    row, col = pos

    if row.between?(0, 7) && col.between?(0, 7) 
      return true
    else
      raise InvalidPositionError
    end
  end

end

