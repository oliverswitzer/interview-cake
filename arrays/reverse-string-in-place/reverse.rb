def reverse!(string)
  midway = string.length / 2

  midway.times do |i|
    swap = string[-1-i]
    string[-1-i] = string[i]
    string[i] = swap
  end

  string
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
