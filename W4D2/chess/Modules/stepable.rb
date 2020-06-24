module Stepable
    def moves
        x, y = self.position
        move_diffs.map { |(dx, dy)| [x + dx, y + dy] }
    end

    private
    def move_diffs

    end

end