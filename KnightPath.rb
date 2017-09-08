require_relative "PolyTreeNode"
require "byebug"

class KnightPathFinder
  def initialize(start_pos)
    @start_pos = start_pos
    @move_tree = self.build_move_tree
    @visited_positions = [start_pos]
  end

  def build_move_tree
    new_move_nodes = new_move_positions(start_pos).map do |arr|
      PolyTreeNode.new(arr)
    end
    root_and_children_nodes = new_move_nodes.map.with_index do |node, idx|
      if idx > 0
        node.parent=(new_move_nodes.first)
      else
        node.children << new_move_nodes[*1..-1]
      end
    end
    current_tree = []
    queue = [root_and_children_nodes[0]]
    while queue.length > 0
      current = queue.shift
      if current.children

    end


  end

  def build_tree_node(pos)
    new_move_nodes = new_move_positions(pos).map do |arr|
      PolyTreeNode.new(arr)
    end
    root_and_children_nodes = new_move_nodes.map.with_index do |node, idx|
      if idx > 0
        node.parent=(new_move_nodes.first)
      else
        node.children << new_move_nodes[*1..-1]
      end
    end
    new_move_nodes 
  end

  def self.valid_moves(pos)
    directions = [[-2,-1], [-2,1], [-1,2], [2,-1], [-1,-2], [2,1], [1,-2], [1,2]]
    moves = []
    directions.each do |arr|
      x = arr[0] + pos[0]
      y = arr[1] + pos[1]
      moves << [x,y] if x >= 0 && y >= 0 && x <= 7 && y <= 7
    end
    moves
  end

  def new_move_positions(pos)
    pos_valid_moves = KnightPathFinder.valid_moves(pos)
    @visited_positions.concat(pos_valid_moves)
    pos_valid_moves
  end
end
