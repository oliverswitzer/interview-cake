# require 'pry'
def binary_search_tree?(root)
  nodes = [[root, -Float::INFINITY, Float::INFINITY]]

  until nodes.empty?
    node, lower_bound, upper_bound = nodes.pop

    return false if node.value <= lower_bound || node.value >= upper_bound

    nodes.unshift [node.left, lower_bound, node.value] if node.left
    nodes.unshift [node.right, node.value, upper_bound] if node.right
  end

  true
end
  

# Tests

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left = nil
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
  #        50
  #    30     70
  #  10  40  60  80
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

  desc = 'both gitsubtrees valid'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(80)
  left.insert_left(20)
  left.insert_right(60)
  right.insert_left(70)
  right.insert_right(90)
  result = binary_search_tree?(tree)
  assert_false(result, desc)

  desc = 'descending linked list'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(40)
  left_left = left.insert_left(30)
  left_left_left = left_left.insert_left(20)
  left_left_left.insert_left(10)
  result = binary_search_tree?(tree)
  assert_true(result, desc)

  #      50
  #          70
  #             60
  #                 80
  desc = 'out of order linked list'
  tree = BinaryTreeNode.new(50)
  right = tree.insert_right(70)
  right_right = right.insert_right(60)
  right_right.insert_right(80)
  result = binary_search_tree?(tree)
  assert_false(result, desc)

  desc = 'one node tree'
  tree = BinaryTreeNode.new(50)
  result = binary_search_tree?(tree)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests