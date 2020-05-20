# In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.
#
# Each order is represented by an "order id" (an integer).
#
# We have our lists of orders sorted numerically already, in arrays. Write a method to merge our arrays of orders into one sorted array.
#
# For example:
#
#   my_array     = [3, 4, 6, 10, 11, 15]
#   alices_array = [1, 5, 8, 12, 14, 19]
#
#   puts merge_arrays(my_array, alices_array)
#   # Prints [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]

def merge_arrays(my_array, alices_array)
  result = []

  (0...(my_array.length + alices_array.length)).each do |i|
    if my_array.empty?
      result << alices_array.shift
      next
    elsif alices_array.empty?
      result << my_array.shift
      next
    end

    if my_array[0] < alices_array[0]
      result << my_array.shift
    else
      result << alices_array.shift
    end
  end

  result
end

# Tests

def run_tests
  desc = 'both arrays are empty'
  actual = merge_arrays([], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty'
  actual = merge_arrays([], [1, 2, 3])
  expected = [1, 2, 3]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty'
  actual = merge_arrays([5, 6, 7], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers'
  actual = merge_arrays([3, 4, 6, 10, 11, 15], [1, 5, 8, 12, 14, 19])
  expected = [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers'
  actual = merge_arrays([2, 4, 6], [1, 3, 7])
  expected = [1, 2, 3, 4, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'arrays are different lengths'
  actual = merge_arrays([2, 4, 6, 8], [1, 7])
  expected = [1, 2, 4, 6, 7, 8]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests