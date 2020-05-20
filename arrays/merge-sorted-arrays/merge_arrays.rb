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

# This takes O(n) time where n is the total of elements in array "a" and array "b". This, assuming the amortized cost
# of appending to an array is O(1).
#
# To improve this I could initialize `result` with a fixed length. This would ensure dynamic array sizing wouldn't cause
# time complexity to worsen.
#
def merge_arrays(a, b)
  result = []

  a_index, b_index = [0, 0]

  until result.length == a.length + b.length
    # When we should put an item from a into the result:
    #
    # If the current element in a is not nil AND EITHER:
    # - The current element in b is nil OR
    # - The current element in a is less than the current element in b

    if !a[a_index].nil? && (b[b_index].nil? || a[a_index] < b[b_index])
      result << a[a_index]
      a_index += 1
    else
      result << b[b_index]
      b_index += 1
    end
  end

  result
end

# Tests

def run_tests
  desc = 'both arrays are empty [], []'
  actual = merge_arrays([], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty [], [1, 2, 3]'
  actual = merge_arrays([], [1, 2, 3])
  expected = [1, 2, 3]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty [5, 6, 7], []'
  actual = merge_arrays([5, 6, 7], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers [3, 4, 6, 10, 11, 15], [1, 5, 8, 12, 14, 19]'
  actual = merge_arrays([3, 4, 6, 10, 11, 15], [1, 5, 8, 12, 14, 19])
  expected = [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
  assert_equal(actual, expected, desc)

  desc = 'both arrays have some numbers [2, 4, 6], [1, 3, 7]'
  actual = merge_arrays([2, 4, 6], [1, 3, 7])
  expected = [1, 2, 3, 4, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'arrays are different lengths [2, 4, 6, 8], [1, 7]'
  actual = merge_arrays([2, 4, 6, 8], [1, 7])
  expected = [1, 2, 4, 6, 7, 8]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests