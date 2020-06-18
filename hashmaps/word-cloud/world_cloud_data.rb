# You want to build a word cloud, an infographic where the size of a word corresponds to how often it appears in the body of text.

class WordCloudData
  attr_reader :words_to_counts

  def initialize(input_string)
    @words_to_counts = {}

    start_word_index = 0
    end_word_index = 0

    (0...input_string.length).each do |i|
      if input_string[i+1].nil? # if next char is nil, we're at the end of the string and need to bump this word
        puts input_string[start_word_index..i]
        bump_word_count(input_string[start_word_index..i])
      elsif is_letter?(input_string[i]) # if current char is word, lets mark the new ending to the word
        end_word_index = i
      else
        # otherwise, we've reached the end of a word. Lets bump the count for this word and find the next start index
        word = input_string[start_word_index..end_word_index]

        bump_word_count(word)

        # below method will find the next letter character to start at
        start_word_index = find_next_letter_start_index(input_string, i)
        end_word_index = nil
      end
    end
  end

  private def find_next_letter_start_index(input_string, starting_index)
    i = starting_index

    until is_letter?(input_string[i]) || i == input_string.length
      i += 1
    end

    i == starting_index ? nil : i
  end

  private def is_letter?(char)
    return false if char.nil?

    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.include?(char)
  end

  def bump_word_count(word)
    if @words_to_counts[word]
      @words_to_counts[word] += 1
    else
      @words_to_counts[word] = 1
    end
  end
end

# Tests

def run_tests
  desc = 'simple sentence'
  input = 'I like cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {'I' => 1, 'like' => 1, 'cake' => 1}
  assert_equal(actual, expected, desc)

  desc = 'longer sentence'
  input = 'Chocolate cake for dinner and pound cake for dessert'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {
      'and' => 1,
      'pound' => 1,
      'for' => 2,
      'dessert' => 1,
      'Chocolate' => 1,
      'dinner' => 1,
      'cake' => 2,
  }
  assert_equal(actual, expected, desc)

  desc = 'punctuation'
  input = 'Strawberry short cake? Yum!'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {'cake' => 1, 'Strawberry' => 1, 'short' => 1, 'Yum' => 1}
  assert_equal(actual, expected, desc)

  desc = 'hyphenated words'
  input = 'Dessert - mille-feuille cake'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {'cake' => 1, 'Dessert' => 1, 'mille-feuille' => 1}
  assert_equal(actual, expected, desc)

  desc = 'ellipses between words'
  input = 'Mmm...mmm...decisions...decisions'

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {'mmm' => 2, 'decisions' => 2}
  assert_equal(actual, expected, desc)

  desc = 'apostrophes'
  input = "Allie's Bakery: Sasha's Cakes"

  word_cloud = WordCloudData.new(input)
  actual = word_cloud.words_to_counts
  expected = {'Bakery' => 1, 'Cakes' => 1, "Allie's" => 1, "Sasha's" => 1}
  assert_equal(actual, expected, desc)
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

run_tests