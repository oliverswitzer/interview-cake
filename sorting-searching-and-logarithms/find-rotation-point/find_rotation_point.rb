# I want to learn some big words so people think I'm smart.
#
# I opened up a dictionary to a page in the middle and started flipping through, looking for words I didn't know. I put each word I didn't know at increasing indices in a huge array I created in memory. When I reached the end of the dictionary, I started from the beginning and did the same thing until I reached the page I started at.
#
# Now I have an array of words that are mostly alphabetical, except they start somewhere in the middle of the alphabet, reach the end, and then start from the beginning of the alphabet. In other words, this is an alphabetically ordered array that has been "rotated." For example:
#
#   words = [
#     'ptolemaic',
#     'retrograde',
#     'supplant',
#     'undulate',
#     'xenoepist',
#     'asymptote',  # <-- rotates here!
#     'babka',
#     'banoffee',
#     'engender',
#     'karpatka',
#     'othellolagkage',
# ]
#
# Write a method for finding the index of the "rotation point," which is where I started working from the beginning of the dictionary. This array is huge (there are lots of words I don't know) so we want to be efficient here.

# Alphabetically sorted, so can probably make use of character codes
# We're trying to find the word that comes first
# Can I use ruby's > or < to tell if a word is before another word?
def find_rotation_point(words)
  floor_index = 0
  ceiling_index = words.length


  while floor_index + 1 < ceiling_index
    half_distance = (ceiling_index - floor_index) / 2
    guess_index = floor_index + half_distance

    if words[guess_index] >= words.first
      floor_index = guess_index
    else
      ceiling_index = guess_index
    end
  end

  ceiling_index
end

# fi 0
# ci 6
# hd 3
# gi = 0 + 3 = 3
# gw = fat
#

# fat > cat
# fi 3
# ci 6
# hd 3/2 = 1
# gi = 3 + 1 = 4
# gw = apex
#
# apex >= cat? false
# ci = 4
#
# fi = 3
# ci = 4
#
# fi + 1 < ci false
#
# break the loop
# lets return ceiling index which is 4
#
# ['cat', 'dad', 'elephant', 'fat', 'apex', 'aluminum']












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