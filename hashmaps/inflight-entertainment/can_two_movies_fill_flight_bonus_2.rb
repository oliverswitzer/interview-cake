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

def can_two_movies_fill_flight?(movie_lengths, flight_length, error_delta: 1)
  seen_movie_lengths = Set.new

  movie_lengths.each do |current_length|
    second_movie_length = flight_length - current_length

    return true if seen_movie_lengths.any? do |length|
      acceptable_range = (second_movie_length - error_delta..second_movie_length + error_delta)

      acceptable_range.include? length
    end

    seen_movie_lengths.add(current_length)
  end

  false
end


# Tests

def run_tests
  desc = 'only one movie'
  result = can_two_movies_fill_flight?([6], 6)
  assert_false(result, desc)

  desc = 'movie total is 1 hour less of flight length'
  result = can_two_movies_fill_flight?([5, 1], 7)
  assert_true(result, desc)

  desc = 'movie total is 1 hour greater of flight length'
  result = can_two_movies_fill_flight?([5, 4], 8)
  assert_true(result, desc)

  desc = 'with error_delta of 2 hours'
  result = can_two_movies_fill_flight?([5, 5], 8, error_delta: 2)
  assert_true(result, desc)

  desc = 'no movies'
  result = can_two_movies_fill_flight?([], 2)
  assert_false(result, desc)
end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests