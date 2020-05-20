# What if we wanted to merge several sorted arrays? Write a method that takes as an input an array of sorted arrays and outputs a single sorted array with all the items from each array.
#
# Do we absolutely have to allocate a new array to use for the merged output? Where else could we store our merged array? How would our method need to change?

def bonus_merge_multiple_arrays(*arrays)
  puts "arrays: #{arrays.inspect}"
  result = []
  total_array_length = arrays.reduce(0) { |acc, arr| acc + arr.length }

  current_indices = Array.new(arrays.length, 0)

  # Until we reach the length of all arrays' length combined
  until result.length == total_array_length

    # Start with the value of the 0th element of the first array. This will be our min that we will compare values to
    # from other arrays.
    #  NOTE: Let's keep track of both the value AND the index we found that value at so we can bump that arrays current index when we
    #    take a value from it. This will prevent us from taking that value again in the future
    current_min = {
      value: arrays[0][current_indices[0]],
      array_index: 0
    }

    # For each of the passed in arrays
    (0...arrays.length).each do |arr_index|
      current_index_of_array = current_indices[arr_index]

      # Case: Add the next element from this array to the result
      #
      # IF
      #    - The current value is not nil AND EITHER
      #      - The rest of the arrays have nothing in them OR
      #      - The current_min value is nil (happens when the first array is empty) OR
      #      - The value we are comparing is less than the current_value (found with greedy algorithm)

      if !!arrays[arr_index][current_index_of_array] && (
      remaining_arrays_are_empty?(arrays, current_array_index: arr_index) ||
        current_min[:value].nil? ||
        arrays[arr_index][current_index_of_array] < current_min[:value])

        current_min = {
          value: arrays[arr_index][current_index_of_array],
          array_index: arr_index
        }
      end
    end

    puts "FINISHED FIRST FIND LOOP WITH MIN VALUE: #{current_min[:value]}"
    current_indices[current_min[:array_index]] += 1
    result << current_min[:value]
    puts "RESULT: #{result.inspect}"
  end

  result
end

def remaining_arrays_are_empty?(arrays, current_array_index:)
  remaining = arrays[0...current_array_index] + arrays[current_array_index + 1..-1]

  remaining.all? { |arr| arr.empty? }
end


def run_tests
  desc = 'all arrays are empty'
  actual = bonus_merge_multiple_arrays([], [], [])
  expected = []
  assert_equal(actual, expected, desc)

  desc = 'first array is empty'
  actual = bonus_merge_multiple_arrays([], [1, 2, 3], [7, 8, 9])
  expected = [1, 2, 3, 7, 8, 9]
  assert_equal(actual, expected, desc)

  desc = 'second array is empty'
  actual = bonus_merge_multiple_arrays([5, 6, 7], [], [])
  expected = [5, 6, 7]
  assert_equal(actual, expected, desc)

  desc = 'all arrays have some numbers'
  actual = bonus_merge_multiple_arrays([2, 4, 6], [1, 3, 7], [5, 8, 9])
  expected = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  assert_equal(actual, expected, desc)

  desc = 'all arrays are different lengths'
  actual = bonus_merge_multiple_arrays([2, 4, 6, 8], [1, 7], [10])
  expected = [1, 2, 4, 6, 7, 8, 10]
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests