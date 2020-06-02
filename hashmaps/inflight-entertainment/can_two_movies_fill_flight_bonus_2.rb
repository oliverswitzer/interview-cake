# You've built an inflight entertainment system with on-demand movie streaming.
#
# Users on longer flights like to start a second movie right when their first one ends, but they complain that the plane usually lands before they can see the ending. So you're building a feature for choosing two movies whose total runtimes will equal the exact flight length.
#
#  Write a method that takes an integer flight_length (in minutes) and an array of integers movie_lengths (in minutes) and returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length.
#
#  When building your method:
#
# Assume your users will watch exactly two movies
# Don't make your users watch the same movie twice
# Optimize for runtime over memory
#
# BONUS
#
# What if we wanted to fill the flight length as nicely as possible with any number of movies (not just 2)?

require 'set'

def can_multiple_movies_fill_flight?(movie_lengths, flight_length)

end


# Tests

def run_tests
  desc = 'only one movie'
  result = can_multiple_movies_fill_flight?([6], 6)
  assert_false(result, desc)

  desc = 'no movies'
  result = can_multiple_movies_fill_flight?([], 2)
  assert_false(result, desc)

  desc = 'multiple movies'
  result = can_multiple_movies_fill_flight?([5, 1, 3, 2], 9)
  assert_true(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests