require 'byebug'

class PolyTreeNode

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if node == nil
      @parent = nil
    else
      @parent.children.delete(self) if @parent
      node.children << self unless node.children.include?(self)
      @parent = node
    end
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "error" unless child_node.parent
    child_node.parent=(nil)
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      child_check = child.dfs(target_value)
      return child_check if child_check
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    while queue.length > 0
      current = queue.shift
      if current.value == target_value
        return current
      else
        queue.concat(current.children)
      end
    end
    nil
  end

end
