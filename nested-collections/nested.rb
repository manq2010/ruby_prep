test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

#   teacher_mailboxes = [
#     ["Adams", "Baker", "Clark", "Davis"],
#     ["Jones", "Lewis", "Lopez", "Moore"],
#     ["Perez", "Scott", "Smith", "Young"]
#   ]

teacher_mailboxes = [
  %w[Adams Baker Clark Davis],
  %w[Jones Lewis Lopez Moore],
  %w[Perez Scott Smith Young]
]

test_scores
teacher_mailboxes

p teacher_mailboxes[0][0]
#=> "Adams"
p teacher_mailboxes[1][0]
#=> "Jones"
p teacher_mailboxes[2][0]
#=> "Perez"

# using negative indices

p 'using negative indices'

p teacher_mailboxes[0][-1]
#=> "Davis"
p teacher_mailboxes[-1][0]
#=> "Perez"
p teacher_mailboxes[-1][-2]
#=> "Smith"

# Accesing an index of a nonexistent nested element

p 'Accesing an index of a nonexistent nested element'

# teacher_mailboxes[3][0]
#=> NoMethodError
# p teacher_mailboxes[0][4]
#=> nil

# p 'Using #dig method to access'
# teacher_mailboxes.dig(3, 0)
#=> nil
# p teacher_mailboxes.dig(0, 4)
#=> nil

p Array.new(3) #=> [nil, nil, nil]
p Array.new(3, 7) #=> [7, 7, 7]
p Array.new(4) { {} } #=> [{}, {}, {}, {}]
p Array.new(4) { |i| i.to_s } #=> ["0", "1", "2", "3"]
p 'This is also a quick way to build up multi-dimensional arrays:'
p Array.new(3) { Array.new(3, 1) }

p 'Another Example'

mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
p mutable

mutable[0][0] = 1000
#=> 1000
p mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]

p 'Second Example'

immutable = Array.new(3) { Array.new(2) }
p immutable
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
p immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]

p 'Adding Elements'

p test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
p test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
p test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

p 'Removing Elements'

p test_scores.pop
#=> [100, 99, 98, 97]
p test_scores
p test_scores[0].pop
#=> 100
p test_scores
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

p 'Iterating over a nested array'

teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

p 'To iterate over the individual elements inside of each row'

teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column:#{column_index} = #{teacher}"
  end
end
#=> Row:0 Column:0 = Adams
#=> Row:0 Column:1 = Baker
#=> Row:0 Column:2 = Clark
#=> Row:0 Column:3 = Davis
#=> Row:1 Column:0 = Jones
#=> Row:1 Column:1 = Lewis
#=> Row:1 Column:2 = Lopez
#=> Row:1 Column:3 = Moore
#=> Row:2 Column:0 = Perez
#=> Row:2 Column:1 = Scott
#=> Row:2 Column:2 = Smith
#=> Row:2 Column:3 = Young
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]

p 'use #flatten before iterating'

teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end
#=> Adams is amazing!
#=> Baker is amazing!
#=> Clark is amazing!
#=> Davis is amazing!
#=> Jones is amazing!
#=> Lewis is amazing!
#=> Lopez is amazing!
#=> Moore is amazing!
#=> Perez is amazing!
#=> Scott is amazing!
#=> Smith is amazing!
#=> Young is amazing!
#=> ["Adams", "Baker", "Clark", "Davis", "Jones", "Lewis", "Lopez", "Moore", "Perez", "Scott", "Smith", "Young"]

p 'Using the above nested array of test scores, let’s determine if any student scored higher than 80 on everything'

test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
p test_scores

test_scores.any? do |scores|
  p scores.all? { |score| score > 80 }
end
#=> false

p 'What do you think will happen if we switch #any? and #all??'

test_scores.all? do |scores|
  p scores.any? { |score| score > 80 }
end
#=> true

p 'Nested Hashes'

vehicles = {
  alice: { year: 2019, make: 'Toyota', model: 'Corolla' },
  blake: { year: 2020, make: 'Volkswagen', model: 'Beetle' },
  caleb: { year: 2020, make: 'Honda', model: 'Accord' }
}

p vehicles

p 'Accessin Data'

p vehicles[:alice][:year]
#=> 2019
p vehicles[:blake][:make]
#=> "Volkswagen"
p vehicles[:caleb][:model]
#=> "Accord"

p 'NoMethodError and #dig'

# vehicles[:zoe][:year]
#=> NoMethodError
p vehicles.dig(:zoe, :year)
#=> nil
p vehicles[:alice][:color]
#=> nil
p vehicles.dig(:alice, :color)
#=> nil

p 'You can add more nested hashes, just like a regular hash.'

vehicles[:dave] = { year: 2021, make: 'Ford', model: 'Escape' }
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
p vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

p 'You can also add an element to one of the nested hashes.'

vehicles[:dave][:color] = 'red'
#=> "red"
p vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}

p 'To delete one of the key/value pairs inside of a nested hash, you first specify the key of the hash'

vehicles[:dave].delete(:color)
#=> "red"
p vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

p 'Methods'

p '#select'

p vehicles.select { |_name, data| data[:year] >= 2020 }
#=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}

p '#collect'

p vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [nil, :caleb, :dave]

p '#collect and #compact'

p vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
#=> [:caleb, :dave]

p '#filter_map'

p vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]

p 'Iterating Over Nested Hashes'

contacts = {
  'Jon Snow' => {
    name: 'Jon',
    email: 'jon_snow@thewall.we',
    favorite_ice_cream_flavors: ['chocolate', 'vanilla', 'mint chip'],
    knows: nil
  },
  'Freddy Mercury' => {
    name: 'Freddy',
    email: 'freddy@mercury.com',
    favorite_ice_cream_flavors: ['strawberry', 'cookie dough', 'mint chip']
  }
}

contacts.each do |person, data|
  puts "#{person}: #{data}"
end

p 'Second Output'

contacts.each do |_person, data|
  # at this level, "person" is Jon Snow or Freddy Mercury and "data" is a hash of
  # key/value pairs to iterate over the "data" hash, we can use the following line:

  data.each do |attribute, value|
    puts "#{attribute}: #{value}"
  end
end

p 'Third Output'

contacts.each do |_person, data|
  # at this level, "person" is Jon Snow or Freddy and "data" is a hash of
  # key/value pairs to iterate over the "data" hash, we can use the following
  # line:

  data.each do |attribute, value|
    # at this level, "attribute" describes the key of :name, :email,
    # :favorite_ice_cream_flavors, or :knows we need to first check and see if
    # the key is :favorite_ice_cream_flavors, if it is, that means the VALUE is
    # an array that we can iterate over to print out each element

    next unless attribute == :favorite_ice_cream_flavors

    value.each do |flavor|
      # here, each index element in an ice cream flavor string
      puts "#{flavor}"
    end
  end
end

p 'Manipulating Output from an Array of Nested Hashes in Ruby'

data = [
  { 'id' => '1', 'properties' => { 'name' => 'Google', 'stock_symbol' => 'GOOG', 'primary_role' => 'company' } },
  { 'id' => '2', 'properties' => { 'name' => 'Facebook', 'stock_symbol' => 'FB', 'primary_role' => 'company' } }
]

p 'Iterate over Array'

data.each do |result|
  puts result['id']
end

p 'Iterate over Hash'

data.each do |result|
  # method 1
  puts result['properties']['name']

  # method 2
  puts result.dig('properties', 'name')
end

p 'Removing elements from a hash'

data.each do |company|
  p company['properties'].delete('primary_role')
end

p data

p 'Adding elements to a hash'

data.each do |company|
p company['properties']['industry'] = 'Advertising/Privacy Invasion'
end

p data
