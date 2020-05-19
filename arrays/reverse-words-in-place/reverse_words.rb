#You're working on a secret team solving coded transmissions.
#
#Your team is scrambling to decipher a recent message, worried it's a plot to break into a major European National Cake Vault. The message has been mostly deciphered, but all the words are backward! Your colleagues have handed off the last step to you.
#
#  Write a method reverse_words!() that takes a message as a string and reverses the order of the words in place. ↴
#
#For example:
#
#  message = 'cake pound steal'
#
#reverse_words!(message)
#
#puts message
## Prints: 'steal pound cake'
#
#When writing your method, assume the message contains only letters and spaces, and all words are separated by one space.

# Takes O(n/2) which is just O(n)
def reverse_characters!(str, index1, index2)
  left_index  = index1
  right_index = index2

  while left_index < right_index

    # Swap characters.
    str[left_index], str[right_index] = \
      str[right_index], str[left_index]

    # Move towards middle.
    left_index  += 1
    right_index -= 1
  end

  str
end

# O(1) space!
def reverse_words!(message)
  # O(n) call
  reverse_characters!(message, 0, message.length - 1)

  last_word_start = 0
  message.length.times do |i|
    if message[i] == ' '
      # reverse_characters! is O(n), but only when you reach a space or nil, NOT for every character. This keeps
      # this code from becoming O(n^2)
      reverse_characters!(message, last_word_start, i - 1)

      last_word_start = i + 1
    elsif message[i + 1] == nil
      reverse_characters!(message, last_word_start, i)
    end
  end
end

# Tests

def run_tests
  desc = 'one word'
  message = 'vault'
  reverse_words!(message)
  expected = 'vault'
  assert_equal(message, expected, desc)

  desc = 'two words'
  message = 'thief cake'
  reverse_words!(message)
  expected = 'cake thief'
  assert_equal(message, expected, desc)

  desc = 'three words'
  message = 'one another get'
  reverse_words!(message)
  expected = 'get another one'
  assert_equal(message, expected, desc)

  desc = 'multiple words same length'
  message = 'rat the ate cat the'
  reverse_words!(message)
  expected = 'the cat ate the rat'
  assert_equal(message, expected, desc)

  desc = 'multiple words different lengths'
  message = 'yummy is cake bundt chocolate'
  reverse_words!(message)
  expected = 'chocolate bundt cake is yummy'
  assert_equal(message, expected, desc)

  desc = 'empty string'
  message = ''
  reverse_words!(message)
  expected = ''
  assert_equal(message, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests