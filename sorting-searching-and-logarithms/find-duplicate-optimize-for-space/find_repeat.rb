# Find a duplicate, Space Edition™.
#
# We have an array of integers, where:
#
# The integers are in the range 1..n
# The array has a length of n+1
# It follows that our array has at least one integer which appears at least twice. But it may have several duplicates, and each duplicate may appear more than twice.
#
# Write a method which finds an integer that appears more than once in our array. (If there are multiple duplicates, you only need to find one of them.)
#
# We're going to run this method on our new, super-hip MacBook Pro With Retina Display™. Thing is, the damn thing came with the RAM soldered right to the motherboard, so we can't upgrade our RAM. So we need to optimize for space!

def find_repeat(numbers)
  numbers = numbers.sort
  last_num = numbers.first

  (1...numbers.length).each do |i|
    if numbers[i] == last_num
      return numbers[i]
    else
      last_num = numbers[i]
    end
  end

  # Whoops--no duplicate.
  raise 'No duplicate!'
end
















# Tests

def run_tests
  desc = 'just the repeated number'
  actual = find_repeat([1, 1])
  expected = 1
  assert_equal(actual, expected, desc)

  desc = 'short array'
  actual = find_repeat([1, 2, 3, 2])
  expected = 2
  assert_equal(actual, expected, desc)

  desc = 'medium array'
  actual = find_repeat([1, 2, 5, 5, 5, 5])
  expected = 5
  assert_equal(actual, expected, desc)

  desc = 'long array'
  actual = find_repeat([4, 1, 4, 8, 3, 2, 7, 6, 5])
  expected = 4
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests