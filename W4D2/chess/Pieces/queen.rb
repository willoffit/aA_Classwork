require "require_all"
require_relative 'piece'
require_relative '../Modules/slideable'

class Queen < Piece
    include Slideable

    def symbol
        return :♛ if @color == :black
        :♕ if @color == :white
    end

    protected

    def move_dirs
        horizontal_dirs + vertical_dirs
    end
end