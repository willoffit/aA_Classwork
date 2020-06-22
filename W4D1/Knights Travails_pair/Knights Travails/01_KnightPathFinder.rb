require_relative "./00_Tree_Node.rb"

class KnightPathFinder

    attr_reader :root_node, :considered_positions
    
    def self.valid_moves(pos)
        x, y = pos 
        possible_moves = [[x+2,y+1],[x+2,y-1],[x-2,y+1],[x-2,y-1],[x+1,y+2],[x+1,y-2],[x-1,y+2],[x-1,y-2]] 
        possible_moves.select do |pos| 
            (0..7).include?(pos[0]) && (0..7).include?(pos[1])
        end 
    end 

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree
    end

    def build_move_tree
        
        queue = [self.root_node] 

        until queue.empty?
          first_node = queue.pop
          children_positions = new_move_positions(first_node.value)
            children_positions.each do |child_pos| 
                new_child = PolyTreeNode.new(child_pos)
                first_node.add_child(new_child)
                queue.unshift(new_child)
            end 
        end
    end 

    def find_path 

    end 

    def new_move_positions(pos)
      new_moves = KnightPathFinder.valid_moves(pos).reject do |move| 
        @considered_positions.include?(move)
      end

      @considered_positions += new_moves
      new_moves
    end

    

end



