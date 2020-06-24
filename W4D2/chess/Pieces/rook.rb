require_relative 'piece'
require_relative '../Modules/slideable'

class Rook < Piece
    include Slideable

    def symbol
       return :♖ if @color == :white
       :♜ if @color == :black
    end

    protected

    def move_dirs
      horizontal_dirs
    end

end