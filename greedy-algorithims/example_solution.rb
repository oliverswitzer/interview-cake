def get_max_profit(stock_prices)
  if stock_prices.length < 2
    raise ArgumentError, 'Getting a profit requires at least 2 prices'
  end

  # We'll greedily update min_price and max_profit, so we initialize
  # them to the first price and the first possible profit.
  min_price = stock_prices[0]
  max_profit = stock_prices[1] - stock_prices[0]

  stock_prices.each_with_index do |current_price, index|

    # Skip the first time, since we already used it
    # when we initialized min_price and max_profit.
    next if index.zero?

    # See what our profit would be if we bought at the
    # min price and sold at the current price.
    potential_profit = current_price - min_price

    # Update max_profit if we can do better.
    max_profit = [max_profit, potential_profit].max

    # Update min_price so it's always
    # the lowest price we've seen so far.
    min_price  = [min_price, current_price].min
  end

  max_profit
end