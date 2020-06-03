# Write an efficient method that checks whether any permutation ↴ of an input string is a palindrome. ↴
#
# You can assume the input string only contains lowercase letters.
#
# Examples:
#
# "civic" should return true
# "ivicc" should return true
# "civil" should return false
# "livci" should return false
# "But 'ivicc' isn't a palindrome!"
#
# If you had this thought, read the question again carefully. We're asking if any permutation of the string is a palindrome. Spend some extra time ensuring you fully understand the question before starting. Jumping in with a flawed understanding of the problem doesn't look good in an interview.

# Using a set means we have O(n) space complexity, where n is the number of unique
# characters (in ASCII this is 128, in UNICODE this is 110,000). Since this is a constant number,
# we can just call this O(1) (constant)
#
# In terms of time complexity, this runs in O(n), where n is the number of chars in the string

require 'set'

def has_palindrome_permutation?(the_string)
  odd_count_chars = Set.new

  the_string.each_char do |char|
    # if this characters count has been considered odd in the past, now its count is even, so delete it from the odd count hash
    if odd_count_chars.include? char
      odd_count_chars.delete(char)
    else
      odd_count_chars.add(char)
    end
  end

  # If there is 1 character with an odd count in the string, then that's ok. Otherwise, this
  # string is not a palindrome
  return true if odd_count_chars.count <= 1

  false
end


# Tests

def run_tests
  desc = 'permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcbcd')
  assert_true(result, desc)

  desc = 'permutation with even number of chars'
  result = has_palindrome_permutation?('aabccbdd')
  assert_true(result, desc)

  desc = 'no permutation with odd number of chars'
  result = has_palindrome_permutation?('aabcd')
  assert_false(result, desc)

  desc = 'no permutation with even number of chars'
  result = has_palindrome_permutation?('aabbcd')
  assert_false(result, desc)

  desc = 'no permutation with even number of chars: aabbcdbbaa'
  result = has_palindrome_permutation?('aaaabbbbccdd')
  assert_true(result, desc)

  desc = 'empty string'
  result = has_palindrome_permutation?('')
  assert_true(result, desc)

  desc = 'one character string'
  result = has_palindrome_permutation?('a')
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests