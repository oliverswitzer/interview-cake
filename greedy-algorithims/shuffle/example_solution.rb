def get_random(floor, ceiling)
  rand(floor..ceiling)
end

def shuffle(array)
  # If it's 1 or 0 items, just return.
  return array if array.length <= 1

  last_index_in_array = array.length - 1

  # Walk through from beginning to end.
  (0..array.length - 2).each do |index_we_are_choosing_for|

    # Choose a random not-yet-placed item to place there
    # (could also be the item currently in that spot).
    # Must be an item AFTER the current item, because the stuff
    # before has all already been placed.
    random_choice_index = get_random(index_we_are_choosing_for, last_index_in_array)

    # Place our random choice in the spot by swapping.
    if random_choice_index != index_we_are_choosing_for
      array[index_we_are_choosing_for], array[random_choice_index] =
        array[random_choice_index], array[index_we_are_choosing_for]
    end
  end
end

sample_array = [1, 2, 3, 4, 5]
puts "Sample array: #{sample_array}"

puts 'Shuffling sample array...'
rv = shuffle(sample_array)
puts rv.inspect
