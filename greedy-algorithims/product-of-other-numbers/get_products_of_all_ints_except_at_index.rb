def get_products_of_all_ints_except_at_index(int_array)
  raise "Must have more than one number in array" if int_array.length <= 1

  products_up_to_int = []
  current_product_before_int = 1
  int_array.each_with_index do |int, i|
    products_up_to_int[i] = current_product_before_int

    current_product_before_int *= int
  end

  products_after_int = []
  current_product_after_int = 1
  i = int_array.length - 1
  while i >= 0
    products_after_int[i] = current_product_after_int
    current_product_after_int *= int_array[i]
    i -= 1
  end

  products_up_to_int
    .zip(products_after_int).map do |after_product, before_product|
      after_product * before_product
  end
end

#[1, 1, 2 * 1]

#[1, 8 * 1, 8 * 2 * 1, 8 * 2 * 4 * 1]







# Tests

def run_tests
  desc = 'short array'
  actual = get_products_of_all_ints_except_at_index([1, 2, 3])
  expected = [6, 3, 2]
  assert_equal(actual, expected, desc)

  desc = 'longer array'
  actual = get_products_of_all_ints_except_at_index([8, 2, 4, 3, 1, 5])
  expected = [120, 480, 240, 320, 960, 192]
  assert_equal(actual, expected, desc)

  desc = 'array has one zero'
  actual = get_products_of_all_ints_except_at_index([6, 2, 0, 3])
  expected = [0, 0, 36, 0]
  assert_equal(actual, expected, desc)

  desc = 'array has two zeros'
  actual = get_products_of_all_ints_except_at_index([4, 0, 9, 1, 0])
  expected = [0, 0, 0, 0, 0]
  assert_equal(actual, expected, desc)

  desc = 'one negative number'
  actual = get_products_of_all_ints_except_at_index([-3, 8, 4])
  expected = [32, -12, -24]
  assert_equal(actual, expected, desc)

  desc = 'all negative numbers'
  actual = get_products_of_all_ints_except_at_index([-7, -1, -4, -2])
  expected = [-8, -56, -14, -28]
  assert_equal(actual, expected, desc)

  desc = 'error with empty array'
  assert_raises(desc) { get_products_of_all_ints_except_at_index([]) }

  desc = 'error with one number'
  assert_raises(desc) { get_products_of_all_ints_except_at_index([1]) }
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