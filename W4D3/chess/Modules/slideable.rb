
module Slideable
  HORIZONTAL_DIRS = [[1,0], [0, 1], [-1, 0], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = []
    move_dirs.each { |(dx, dy)| possible_moves += grow_unblocked_moves_in_dir(dx, dy) }
    possible_moves
  end

  private

  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)
      x, y = self.position
      unblocked_moves = []
      next_position = [x + dx, y + dy]

      while board.valid_position?(next_position) && !(board[next_position].color == self.color)
        unblocked_moves << next_position
        break if board[next_position].color != self.color && board[next_position] != @sentinel
        x, y = next_position
        next_position = [x + dx, y + dy]
      end

      unblocked_moves
    end
end