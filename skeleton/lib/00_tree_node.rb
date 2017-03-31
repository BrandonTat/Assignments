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

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent
    parent.children << self unless parent.nil?
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
      child_node.parent = nil
    else
      raise "Error: Node is not a child of parent"
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def dfs(target_value)
    return self if @value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      current_node.children.each do |child|
        queue << child
      end
    end

    nil
  end
end
