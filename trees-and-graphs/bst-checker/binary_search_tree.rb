def binary_search_tree?(root)
  nodes = [[root, []]]

  until nodes.empty?
    node, ancestors = nodes.pop
    p "current: #{node.value}"
    p "node left: #{node.left.value}" if node.left
    p "node right: #{node.right.value}" if node.right
    p "ancestors: #{ancestors.map(&:value)}"

    return false if node.left &&
        (node.left.value > node.value || ancestors.any? { |n| n.value < node.left.value })
    return false if node.right &&
        (node.right.value < node.value || ancestors.any? { |n| n.value > node.right.value })

    # p "left: #{node.left.value}" if node.left
    # p "right: #{node.right.value}" if node.right

    # return false if current node is left and its ANCESTOR is less than it
    # return false if current node is right and its ANCESTOR is greater than it
    # ancestors
    nodes.unshift [node.left, ancestors + [node]] if !!node.left
    nodes.unshift [node.right, ancestors + [node]] if !!node.right
  end

  true
end


















# Tests

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
  end
end

def run_tests
  #
  desc = 'valid full tree'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right.insert_left(60)
  right.insert_right(80)
  result = binary_search_tree?(tree)
  assert_true(result, desc)

  # desc = 'both gitsubtrees valid'
  # tree = BinaryTreeNode.new(50)
  # left = tree.insert_left(30)
  # right = tree.insert_right(80)
  # left.insert_left(20)
  # left.insert_right(60)
  # right.insert_left(70)
  # right.insert_right(90)
  # result = binary_search_tree?(tree)
  # assert_false(result, desc)
  #
  # desc = 'descending linked list'
  # tree = BinaryTreeNode.new(50)
  # left = tree.insert_left(40)
  # left_left = left.insert_left(30)
  # left_left_left = left_left.insert_left(20)
  # left_left_left.insert_left(10)
  # result = binary_search_tree?(tree)
  # assert_true(result, desc)

  # #      50
  # #          70
  # #             60
  # #                 80
  # desc = 'out of order linked list'
  # tree = BinaryTreeNode.new(50)
  # right = tree.insert_right(70)
  # right_right = right.insert_right(60)
  # right_right.insert_right(80)
  # result = binary_search_tree?(tree)
  # assert_false(result, desc)
  #
  # desc = 'one node tree'
  # tree = BinaryTreeNode.new(50)
  # result = binary_search_tree?(tree)
  # assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests