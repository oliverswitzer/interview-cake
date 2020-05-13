def sorted_array_is_exhausted(sorted_right, sorted_right_index)
  sorted_right_index >= sorted_right.length
end

def merge_sort(unsorted)
  # puts "merge sort with unsorted array"
  # puts unsorted.inspect

  return unsorted if unsorted.length == 1

  center = unsorted.length / 2

  unsorted_left = unsorted[0..center - 1]
  unsorted_right = unsorted[center..unsorted.length]

  sorted_left = merge_sort(unsorted_left)
  sorted_right = merge_sort(unsorted_right)

  sorted = []

  sorted_left_index = 0
  sorted_right_index = 0

  unsorted.each_with_index do |_, i|
    # puts "sorting current unsorted array"
    # puts unsorted.inspect
    # puts "current unsorted left"
    # puts unsorted_left.inspect
    # puts "current unsorted right"
    # puts unsorted_right.inspect
    # puts "current sorted"
    # puts sorted.inspect
    if sorted_left_index < sorted_left.length &&
       (sorted_array_is_exhausted(sorted_right, sorted_right_index) ||
         sorted_left[sorted_left_index] < sorted_right[sorted_right_index])

      sorted[i] = sorted_left[sorted_left_index]
      sorted_left_index += 1
    else
      sorted[i] = sorted_right[sorted_right_index]
      sorted_right_index += 1
    end
  end

  sorted
end

test_case_1 = [3, 1, 2, 4]
test_case_2 = [1, 4, 1, 11, 9, 7, 3]

puts "Merge sort result #{test_case_1}: #{merge_sort(test_case_1)}"
puts "Merge sort result #{test_case_2}: #{merge_sort(test_case_2)}"
