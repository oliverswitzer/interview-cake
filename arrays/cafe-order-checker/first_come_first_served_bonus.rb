#My cake shop is so popular, I'm adding some tables and hiring wait staff so folks can have a cute sit-down cake-eating experience.
#
#I have two registers: one for take-out orders, and the other for the other folks eating inside the cafe. All the customer orders get combined into one list for the kitchen, where they should be handled first-come, first-served.
#
#Recently, some customers have been complaining that people who placed orders after them are getting their food first. Yikes—that's not good for business!
#
#  To investigate their claims, one afternoon I sat behind the registers with my laptop and recorded:
#
#    The take-out orders as they were entered into the system and given to the kitchen. (take_out_orders)
#  The dine-in orders as they were entered into the system and given to the kitchen. (dine_in_orders)
#  Each customer order (from either register) as it was finished by the kitchen. (served_orders)
#  Given all three arrays, write a method to check that my service is first-come, first-served. All food should come out in the same order customers requested it.
#
#    We'll represent each customer order as a unique integer.
#
#As an example,
#   Take Out Orders: [1, 3, 5]
#    Dine In Orders: [2, 4, 6]
#     Served Orders: [1, 2, 4, 6, 5, 3]
#
# would not be first-come, first-served, since order 3 was requested before order 5 but order 5 was served first.
#
#But,
#
#   Take Out Orders: [17, 8, 24]
#    Dine In Orders: [12, 19, 2]
#     Served Orders: [17, 8, 12, 19, 24, 2]
#
# would be first-come, first-served.

#-------
# BONUS:
#
# This assumes each customer order in served_orders is unique. How can we adapt this to handle arrays of customer orders with potential repeats?
# Our implementation returns true when all the items in dine_in_orders and take_out_orders are first-come first-served in served_orders and false otherwise. That said, it'd be reasonable to raise an exception if some orders that went into the kitchen were never served, or orders were served but not paid for at either register. How could we check for those cases?
# Our solution iterates through the customer orders from front to back. Would our algorithm work if we iterated from the back towards the front? Which approach is cleaner?
# This runs in O(n) time, since we just iterate over served_orders once
#
def first_come_first_served?(take_out_orders, dine_in_orders, served_orders)

end



# Tests

def run_tests
  desc = 'both registers have same number of orders'
  result = first_come_first_served?([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
  assert_true(result, desc)

  desc = 'registers have different lengths'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
  assert_false(result, desc)

  desc = 'one register is empty'
  result = first_come_first_served?([], [2, 3, 6], [2, 3, 6])
  assert_true(result, desc)

  desc = 'served orders is missing orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 6, 3, 5])
  assert_false(result, desc)

  desc = 'served orders has extra orders'
  result = first_come_first_served?([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
  assert_false(result, desc)

  desc = 'one register has extra orders';
  result = first_come_first_served?([1, 9], [7, 8], [1, 7, 8]);
  assert_false(result, desc)

  desc = 'one register has unserved orders';
  result = first_come_first_served?([55, 9], [7, 8], [1, 7, 8, 9]);
  assert_false(result, desc)

  desc = 'order numbers are not sequential'
  result = first_come_first_served?([27, 12, 18], [55, 31, 8], [55, 31, 8, 27, 12, 18])
  assert_true(result, desc)

end

def assert_true(value, desc)
  puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
end

def assert_false(value, desc)
  puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
end

run_tests