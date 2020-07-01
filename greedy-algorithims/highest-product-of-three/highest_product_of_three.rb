# Given an array of integers, find the highest product you can get from three of the integers.
#
# The input array_of_ints will always have at least three integers.

def highest_product_of_3(array_of_ints)
  raise Error if array_of_ints.length < 3

  max_int = array_of_ints.first(2).max
  min_int =  array_of_ints.first(2).min

  highest_product_of_two = lowest_product_of_two = array_of_ints[0] * array_of_ints[1]

  highest_product_of_three = [
    highest_product_of_two * array_of_ints[2],
    lowest_product_of_two * array_of_ints[2]
  ].max

  array_of_ints.each_with_index do |current_int, i|
    next if i < 2

    highest_product_of_three = [
      highest_product_of_three,
      current_int * highest_product_of_two,
      current_int * lowest_product_of_two
    ].max

    highest_product_of_two = [
      highest_product_of_two,
      current_int * max_int,
      current_int * min_int
    ].max

    lowest_product_of_two = [
      lowest_product_of_two,
      current_int * min_int,
      current_int * max_int
    ].min

    max_int = [current_int, max_int].max
    min_int = [current_int, min_int].min
  end

  highest_product_of_three
end





# Tests

def run_tests
  actual = highest_product_of_3([1, 2, 3, 4])
  expected = 24
  assert_equal(actual, expected, 'short array')

  actual = highest_product_of_3([6, 1, 3, 5, 7, 8, 2])
  expected = 336
  assert_equal(actual, expected, 'longer array')

  actual = highest_product_of_3([-5, 4, 8, 2, 3])
  expected = 96
  assert_equal(actual, expected, 'array has one negative')

  actual = highest_product_of_3([-10, 1, 3, 2, -10])
  expected = 300
  assert_equal(actual, expected, 'array has two negatives')

  actual = highest_product_of_3([-5, -1, -3, -2])
  expected = -6
  assert_equal(actual, expected, 'array is all negatives')

  assert_raises('empty array raises error') do
    highest_product_of_3([])
  end

  assert_raises('one number raises error') do
    highest_product_of_3([1])
  end

  assert_raises('two numbers raises error') do
    highest_product_of_3([1, 1])
  end
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