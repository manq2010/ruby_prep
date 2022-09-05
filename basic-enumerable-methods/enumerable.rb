friends = %w[Sharon Leo Leila Brian Arun Katlego Mancoba]
invited_list = []

for friend in friends do
  invited_list.push(friend) if friend != 'Brian'
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]

# friends = %w[Sharon Leo Leila Brian Arun]
# friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p friends.select { |friend| friend != 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]

p friends.reject { |friend| friend == 'Leo' }
#=> ["Sharon", "Brian", "Leila", "Arun"]

p friends.each { |friend| puts 'Hello, ' + friend }
#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun
#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]

my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

my_hash = { 'one' => 1, 'two' => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

# one is 1
# two is 2

p my_hash
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

# the pair is ['one', 1]
# the pair is ['two', 2]
p my_hash
#=> { "one" => 1, "two" => 2}

# friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p friends.each { |friend| friend.upcase }
p friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

# fruits = ["apple", "banana", "strawberry", "pineapple"]
fruits = %w[apple banana strawberry pineapple]

fruits.each_with_index { |fruit, index| puts fruit if index.odd? || index.even? }

fruits.each_with_index { |fruit, index| puts fruit if index.even? }
p fruits

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]

# friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
p friends
p shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']

# friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

p friends

my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

p my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]

salaries = [1200, 1500, 1100, 1800]

p salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]

invited_list = []

friends.each do |friend|
  invited_list.push(friend) if friend != 'Brian'
end

p invited_list
#=> ["Sharon", "Leo", "Leila", "Arun"]

p friends.select { |friend| friend != 'Mancoba' }

#=> ["Sharon", "Leo", "Leila", "Arun"]

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }

p responses.select { |_person, response| response != 'yes' }
#=> {"Sharon"=>"yes", "Arun"=>"yes"}

my_numbers = [42, 215, -27, -518, 289]
sum = 0

my_numbers.each { |number| sum += number }

p sum
#=> 26

p my_numbers.reduce { |sum, number| sum + number }
#=> 26

p my_numbers.reduce(100) { |sum, number| sum + number }

votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack", 'Mancoba', 'Mancoba', 'Katlego',
         'Testing one two in PE']

votes.each_with_object(Hash.new(0)) do |vote, result|
  result[vote] += 1
  p result
end

#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}

p hundreds = Hash.new(100)
p hundreds['first']         #=> 100
p hundreds['mine']          #=> 100
p hundreds['yours']         #=> 100
p hundreds['new']
p hundreds['new'] = 99
p hundreds['new']
p hundreds['new'] = 98
p hundreds['new']

# friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

p friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends = %w[Sharon Leo Leila Brian Arun]

invited_friends = friends.select { |friend| friend != 'Brian' }

p friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]

###############

friends = %w[Sharon Leo Leila Brian Arun James Joe Jim]

def invited_friends(friends)
  friends.select { |friend| friend != 'Leo' }
end

p friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

p invited_friends(friends)
#=> ["Sharon", "Leo", "Leila", "Arun"]

#################

class Array
  def keep_evens
    result_array = []
    for num in self
      result_array << num if num.even?
    end
    result_array
  end
end

p my_array = [1, 2, 3, 4, 5, 6, 7, 8, 100]
p my_array.keep_evens
#=> [2,4,6,8,100]
p my_array.select { |item| item.even? }
p my_array.collect { |num| num**2 }
p my_array.inject(0) { |running_total, item| running_total + item }
# group_by
p friends.group_by { |name| name.length }
#=> {6=>["Sharon"], 3=>["Leo"], 5=>["Leila", "Brian"], 4=>["Arun"]}

# grep
p friends.grep(/J/)
#=> ["James", "Joe", "Jim"]

# Convert strings to integers:
array = %w[11 21 5]

p array.map { |str| str.to_i }
# [11, 21, 5]

# Convert hash values to symbols:

hash = { bacon: 'protein', apple: 'fruit' }

p hash.map { |k, v| [k, v.to_sym] }.to_h
# {:bacon=>:protein, :apple=>:fruit}

# How to Use Map With an Index

array = %w[a b c]

p array.map.with_index { |ch, idx| [ch, idx] }

# [["a", 0], ["b", 1], ["c", 2]]

# ["11", "21", "5"].map(&:to_i)
p %w[11 21 5].map(&:to_i)


# p ["orange", "apple", "banana"].map(&:class)
p ["orange", "apple", 1].map(&:class)
