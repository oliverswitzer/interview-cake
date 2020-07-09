def find_duplicate(int_array)
  current_position = int_array[-1]

  # Step 1: Get our cursor to the end of the int array list, so that we
  # are guaranteed to be in a loop when we try to find the loop length
  (int_array.length - 1).times do
    current_position = int_array[current_position - 1]
  end

  loop_start_position = current_position
  loop_length = 0

  # Step 2: Find loop length
  # Let's get the loop length by iterating until:
  # - the loop starting position equals the current position AND
  # - the loop length is greater than one (so we don't exit early since we technically set loop starting pos = current position to start)
  until loop_start_position == current_position && loop_length > 0
    current_position = int_array[current_position - 1]
    loop_length += 1
  end

  # Step 3: Use "stick" approach to find where the actually starts
  # We need to define two pointers that will eventually be spaced apart
  # by the length of the loop. Lets initialize them as the same.
  pointer_1 = pointer_2 = int_array[-1]

  # Now, let's space pointer_2 a loop-length away from pointer 1, so that
  # we can step through int_array using the "stick approach". We can do this
  # by jumping through our linked list `loop_length` times.
  loop_length.times do
    pointer_2 = int_array[pointer_2 - 1]
  end

  # Great, now that we know our two pointers, we can step through our
  # circle with both pointers until the pointers match! Who knew sticks could be so useful!
  until pointer_1 == pointer_2 do
    pointer_1 = int_array[pointer_1 - 1]
    pointer_2 = int_array[pointer_2 - 1]
  end

  pointer_1 if pointer_1 == pointer_2
end


# Tests

def run_tests
  desc = 'just the repeated number'
  actual = find_duplicate([1, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'short array'
  actual = find_duplicate([1, 2, 3, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_duplicate([1, 2, 5, 5, 5, 5])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'sample array'
  actual = find_duplicate([3, 1, 2, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'long array'
  actual = find_duplicate([4, 1, 4, 8, 3, 2, 7, 6, 5])
  expected = 4
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests