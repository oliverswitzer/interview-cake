def find_rotation_point(words)
  first_word = words.first

  floor_index = 0
  ceiling_index = words.length - 1

  while floor_index < ceiling_index

    # Guess a point halfway between floor and ceiling.
    guess_index = (floor_index + ceiling_index) / 2

    # If guess comes after first word or is the first word.
    if words[guess_index] >= first_word
      # Go right.
      floor_index = guess_index
    else
      # Go left.
      ceiling_index = guess_index
    end

    # Return if floor and ceiling have converged.
    # Between floor and ceiling is where we flipped to the beginning,
    # so ceiling is alphabetically first.
    return ceiling_index if floor_index + 1 == ceiling_index
  end
end


# Tests

def run_tests
  desc = 'small array'
  actual = find_rotation_point(['cape', 'cake'])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_rotation_point(['grape', 'orange', 'plum', 'radish', 'apple'])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'large array'
  actual = find_rotation_point(['ptolemaic', 'retrograde', 'supplant',
    'undulate', 'xenoepist', 'asymptote',
    'babka', 'banoffee', 'engender',
    'karpatka', 'othellolagkage'])
  expected = 5
  assert_equal(actual, expected, desc)

  # Are we missing any edge cases?
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests