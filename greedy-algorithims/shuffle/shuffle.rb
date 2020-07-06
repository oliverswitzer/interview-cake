def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(array)
  (0...array.length - 1).each do |i|
    swap_index = get_random(i, array.length - 1)
    element_to_swap = array[swap_index]

    array[swap_index] = array[i]
    array[i] = element_to_swap
  end

  array
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
rv = shuffle(sample_array)
puts rv.inspect
