# Write a method to find the 2nd largest element in a binary search tree.

def find_second_largest(root_node)
  nodes = [root_node]
  first_largest = root_node.value
  second_largest = root_node.left.value if root_node.left

  until nodes.empty?
    node = nodes.pop

    if node.value > first_largest
      first_largest = node.value
    end

    if node.value > second_largest && node.value < first_largest
      second_largest = node.value
    end

    nodes << node.right if node.right
    nodes << node.left if node.right
  end

  second_largest
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
  #           50
  #       30       70
  #    10  40    60   80
  desc = 'full tree'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right.insert_left(60)
  right.insert_right(80)
  actual = find_second_largest(tree)
  expected = 70
  assert_equal(actual, expected, desc)

  #             50
  #        30       70
  #     10   40   60
  desc = 'largest has a left child'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right.insert_left(60)
  actual = find_second_largest(tree)
  expected = 60
  assert_equal(actual, expected, desc)

  #            50
  #      30           70
  #   10    40      60    40
  #              55   65
  #                58
  desc = 'largest has a left subtree'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  right = tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  right_left = right.insert_left(60)
  right_left_left = right_left.insert_left(55)
  right_left.insert_right(65)
  right_left_left.insert_right(58)
  actual = find_second_largest(tree)
  expected = 65
  assert_equal(actual, expected, desc)

  desc = 'second largest is root node'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(30)
  tree.insert_right(70)
  left.insert_left(10)
  left.insert_right(40)
  actual = find_second_largest(tree)
  expected = 50
  assert_equal(actual, expected, desc)

  desc = 'descending linked list'
  tree = BinaryTreeNode.new(50)
  left = tree.insert_left(40)
  left_left = left.insert_left(30)
  left_left_left = left_left.insert_left(20)
  left_left_left.insert_left(10)
  actual = find_second_largest(tree)
  expected = 40
  assert_equal(actual, expected, desc)

  desc = 'ascending linked list'
  tree = BinaryTreeNode.new(50)
  right = tree.insert_right(60)
  right_right = right.insert_right(70)
  right_right.insert_right(80)
  actual = find_second_largest(tree)
  expected = 70
  assert_equal(actual, expected, desc)

  desc = 'error when tree has one node'
  tree = BinaryTreeNode.new(50)
  assert_raises(desc) { find_second_largest(tree) }

  desc = 'error when tree is empty'
  assert_raises(desc) { find_second_largest(nil) }
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue
  puts "#{desc} ... PASS"
end

run_tests