def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(array)
  array.each_with_index do |current, i|
    swap_index = get_random(0, array.length - 1)
    swap_member = array[swap_index]

    array[swap_index] = current
    array[i] = swap_member
  end

  array
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
rv = shuffle(sample_array)
puts rv.inspect
