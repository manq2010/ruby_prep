shoes = {
  'summer' => 'sandals',
  'winter' => 'boots'
}

shoes['summer']   #=> "sandals"

#   shoes["hiking"]   #=> nil
#   shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"
#   shoes.fetch("hiking", "hiking boots") #=> "hiking boots"

shoes['fall'] = 'sneakers'

shoes #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}
shoes['summer'] = 't-shirt'

shoes

shoes.delete('summer') #=> "flip-flops"
shoes #=> {"winter"=>"boots", "fall"=>"sneakers"}

# Methods

books = {
  'Infinite Jest' => 'David Foster Wallace',
  'Into the Wild' => 'Jon Krakauer'
}

books.keys      #=> ["Infinite Jest", "Into the Wild"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer"]

hash1 = { 'a' => 100, 'b' => 200 }
hash2 = { 'b' => 254, 'c' => 300 }
hash1.merge(hash2) #=> { "a" => 100, "b" => 254, "c" => 300 }

# 'Rocket' syntax
american_cars = {
  chevrolet: 'Corvette',
  ford: 'Mustang',
  dodge: 'Ram'
}

# 'Symbols' syntax
japanese_cars = {
  honda: 'Accord',
  toyota: 'Corolla',
  nissan: 'Altima'
}

print american_cars[:ford]    #=> "Mustang"
puts
print japanese_cars[:honda]   #=> "Accord"
puts

# iterating_over_hashes.rb

person = { name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown' }

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end

# optional_parameters.rb

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting('Bob')
greeting('Bob', { age: 62, city: 'New York City' })

# Exercise

# Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array

family = { uncles: %w[bob joe steve],
           sisters: %w[jane jill beth],
           brothers: %w[frank rob david],
           aunts: %w[mary sally susan] }

immediate_family = family.select do |k, _v|
  %i[sisters brothers].include?(k)
end

arr = immediate_family.values.flatten

p arr

# Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

cat = { name: 'whiskers' }
weight = { weight: '10 lbs' }
puts cat.merge(weight)
puts cat                  # => {:name=>"whiskers"}
puts weight               # => {:weight=>"10 lbs"}
puts cat.merge!(weight)
puts cat                  # => {:name=>"whiskers", :weight=>"10 lbs"}
puts weight               # => {:weight=>"10 lbs"}

# Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

opposites = { positive: 'negative', up: 'down', right: 'left' }

opposites.each_key { |key| puts key }
opposites.each_value { |value| puts value }
opposites.each { |key, value| puts "The opposite of #{key} is #{value}" }
