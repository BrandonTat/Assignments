require_relative "00_tree_node"

class KnightPathFinder

  MOVEMENTS = [
    [1, 2],
    [-1, 2],
    [-1, -2],
    [1, -2],
    [-2, 1],
    [-2, -1],
    [2, 1],
    [2, -1]
  ]

  def self.valid_moves(pos)
    moves = []
    x, y = pos
    MOVEMENTS.each do |move|
      moves << [move[0] + x, move[1] + y]
    end
    filter_moves(moves)
  end

  def self.filter_moves(moves)
    final_moves = []
    moves.each do |move|
      if move[0].between?(0, 7) && move[1].between?(0, 7)
        final_moves << move
      end
    end

    final_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
    @visited_positions.each do |position|
      new_moves.delete(position)
    end
    @visited_positions += new_moves
    new_moves
  end

  def build_move_tree
    # tree = PolyTreeNode.new(@start_pos)
    queue = [@start_pos]
    queue.concat(self.new_move_position(tree.value))
    until queue.empty?
      current_node = queue.shift
      if current_node == @start_pos
        tree = PolyTreeNode.new(@start_pos)
        queue.each do |el|
          el = PolyTreeNode.new(el)
          tree.add_child(el)
          el.parent = tree
        end
      else
        tree = PolyTreeNode.new(current_node)
        tree.children


      # if current_node == @start_pos
      #   current_node = PolyTreeNode.new(@start_pos)
      #   current_node.children = queue
      #   queue.each do |el|
      #     queue.concat(self.new_move_positions(el))
      #     el = PolyTreeNode.new(el)
      #     el.parent = current_node
      #   end
      # end
    end
  end

end
#
k = KnightPathFinder.new([3,3])
p KnightPathFinder.valid_moves([0,0])
p k.new_move_positions([1, 2])
