votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end

def find_word_lengths(word_list)
    # use #reduce to iterate through each item of the word_list (an array)
    # return a hash with each word as the key and its length as the value
    # hint: look at the documentation and review the reduce examples in basic enumerable lesson
  end

  votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.each_with_object(Hash.new(0)) do |vote, result|
  result[vote] += 1
end