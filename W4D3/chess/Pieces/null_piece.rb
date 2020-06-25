require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize()

  end

  def inspect
    "Missingno"
  end
  
end