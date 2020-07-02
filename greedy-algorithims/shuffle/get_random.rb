def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(array)
  already_shuffled = []

  array = array.each_with_index.map do |int, i|
    shuffled_int = array[get_random(0, array.length - 1)]

    while already_shuffled.include? shuffled_int
      shuffled_int = array[get_random(0, array.length - 1)]
    end

    already_shuffled << shuffled_int
    shuffled_int
  end

  array
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
rv = shuffle(sample_array)
puts rv.inspect
