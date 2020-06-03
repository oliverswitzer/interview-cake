def has_palindrome_permutation?(the_string)
  char_occurences = {}

  the_string.each_char do |char|
    if char_occurences[char]
      char_occurences[char] += 1
    else
      char_occurences[char] = 1
    end
  end

  return true if char_occurences.values.all? { |v| v == 2 }

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