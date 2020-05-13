def reverse!(str)

  left_index  = 0
  right_index = str.length - 1

  while left_index < right_index

    # Swap characters.
    str[left_index], str[right_index] = \
      str[right_index], str[left_index]

    # Move towards middle.
    left_index  += 1
    right_index -= 1

  end
end


# Tests

def run_tests
  desc = 'empty string'
  string = ''
  reverse!(string)
  expected = ''
  assert_equal(string, expected, desc)

  desc = 'single character string'
  string = 'A'
  reverse!(string)
  expected = 'A'
  assert_equal(string, expected, desc)

  desc = 'longer string'
  string = 'ABCDE'
  reverse!(string)
  expected = 'EDCBA'
  assert_equal(string, expected, desc)

  desc = 'even string'
  string = 'ABCD'
  reverse!(string)
  expected = 'DCBA'
  assert_equal(string, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests
