require_relative "piece"

class Pawn < Piece

  def symbol
    return :♟︎ if @color == :black
    :♙ if @color == :white
  end

  def move_dirs
    forward_steps + side_attacks
  end

  private 

  def at_start_row?
    return true if self.color == :black && self.position[0] == 1
    return true if self.color == :white && self.position[0] == 6
  end

  def forward_dir
    return 1 if self.color == :black
    return -1 if self.color == :white 
  end

  def forward_steps
    if self.at_start_row?
        [[2, 0], [1, 0]]
    else
        [[1, 0]]
    end
  end

  def side_attacks
    [1, 1]
  end

end

# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _