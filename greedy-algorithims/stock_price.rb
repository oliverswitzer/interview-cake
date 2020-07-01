# Writing programming interview questions hasn't made me rich yet ... so I might give up and start trading Apple stocks all day instead.
#
# First, I wanna know how much money I could have made yesterday if I'd been trading Apple stocks all day.
#
# So I grabbed Apple's stock prices from yesterday and put them in an array called stock_prices, where:
#
# The indices are the time (in minutes) past trade opening time, which was 9:30am local time.
# The values are the price (in US dollars) of one share of Apple stock at that time.
# So if the stock cost $500 at 10:30am, that means stock_prices[60] = 500.
#
# Write an efficient method that takes stock_prices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.
#
# For example:
#
#   stock_prices = [10, 7, 5, 8, 11, 9]
#
# get_max_profit(stock_prices)
# # returns 6 (buying for $5 and selling for $11)
#
# Ruby
# No "shorting"—you need to buy before you can sell. Also, you can't buy and sell in the same time step—at least 1 minute has to pass.

# Current implementation complexity:
#
# O(n) time
# O(n) space (We slice the array -- this takes up O(n - 1) space since we initialize a new array)
def get_max_profit(stock_prices)
  min_price = stock_prices[0]
  current_profit = stock_prices[1] - min_price

  stock_prices[1..-1].each do |current_price|
    if current_price < min_price
      min_price = current_price
    else
      potential_profit = current_price - min_price

      if potential_profit > current_profit
        current_profit = potential_profit
      end
    end
  end

  current_profit
end







# Tests

def run_tests
  desc = 'price goes up then down'
  actual = get_max_profit([1, 5, 3, 2])
  expected = 4
  assert_equal(actual, expected, desc)

  desc = 'price goes down then up'
  actual = get_max_profit([7, 2, 8, 9])
  expected = 7
  assert_equal(actual, expected, desc)

  desc = 'price goes up all day'
  actual = get_max_profit([1, 6, 7, 9])
  expected = 8
  assert_equal(actual, expected, desc)

  desc = 'price goes down all day'
  actual = get_max_profit([9, 7, 4, 1])
  expected = -2
  assert_equal(actual, expected, desc)

  desc = 'price stays the same all day'
  actual = get_max_profit([1, 1, 1, 1])
  expected = 0
  assert_equal(actual, expected, desc)

  desc = 'error with empty prices'
  assert_raises(desc) {
    get_max_profit([])
  }

  desc = 'error with one price'
  assert_raises(desc) {
    get_max_profit([1])
  }
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue
  puts "#{desc} ... PASS"
end

run_tests