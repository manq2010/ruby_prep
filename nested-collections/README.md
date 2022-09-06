### Nested Collections

Table of Contents
===

* [Nested Arrays](#nested-arrays)
* [Accessing Elements - Arrays](#accessing-elements---arrays)
* [Creating a new nested array](#creating-a-new-nested-array)
* [Adding and Removing Elements - Arrays](#adding-and-removing-elements---arrays)
* [Iterating over a nested array](#iterating-over-a-nested-array)
* [Nested Hashes](#nested-hashes)
* [Accessing Data - Hashes](#accessing-data---hashes)
* [Adding and Removing Data - Hashes](#adding-and-removing-data---hashes)
* [Methods](#methods)
* [More Resources](#more-resources)

Nested Arrays
---

An array that contains other arrays. Nested arrays can be useful to store groups of similar data or positional data.

```ruby
test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]
```

Accessing Elements - Arrays
---

Accessing a specific element within a nested array is as simple as calling array[x][y], where x is the index of the nested element and y is the index inside of the nested element.

```ruby
teacher_mailboxes[0][0]
#=> "Adams"
teacher_mailboxes[1][0]
#=> "Jones"
teacher_mailboxes[2][0]
#=> "Perez"
```

You can also use negative indices to return elements from the end of an array, starting at [-1].

```ruby
teacher_mailboxes[0][-1]
#=> "Davis"
teacher_mailboxes[-1][0]
#=> "Perez"
teacher_mailboxes[-1][-2]
#=> "Smith"
```

If you try to access an index of a nonexistent nested element, it will raise an `NoMethodError`, because the nil class does not have a `[]` method. However, just like a regular array, if you try to access a nonexistent index inside of an existing nested element, it will return nil.

```ruby
teacher_mailboxes[3][0]
# => NoMethodError
teacher_mailboxes[0][4]
# => nil
```

If you want a nil value returned when trying to access an index of a nonexistent nested element, you can use the `#dig` method. This method can also be used when accessing a nonexistent index inside of an existing nested element.

```ruby
teacher_mailboxes.dig(3, 0)
#=> nil
teacher_mailboxes.dig(0, 4)
#=> nil
```

Creating a new nested array
---

To create an array of mutable objects (string, array, hash, etc), you will need to pass the default value for `Array.new` via a block, using curly braces, instead of the second optional argument. The code in the block gets evaluated for every slot in the array, creating multiple objects to initialize the array with, rather than references to the same object.

```ruby
mutable = Array.new(3, Array.new(2))
#=> [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
#=> 1000
mutable
#=> [[1000, nil], [1000, nil], [1000, nil]]
```

Changing the value of the first element in the first nested array, causes the first element to change in all three nested arrays! This same behavior will happen with strings, hashes, or any other mutable objects.

```ruby
immutable = Array.new(3) { Array.new(2) }
#=> [[nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
#=> 1000
immutable
#=> [[1000, nil], [nil, nil], [nil, nil]]
```

Changing the value of the first element in the first nested array does not cause the value to change in any other nested array.

Adding and Removing Elements - Arrays
---

You can add another element to the end of nested array using the `#push` method or the shovel operator `<<`. If you want to add an element to a specific nested array, you will need to specify the index of the nested array.

```ruby
test_scores << [100, 99, 98, 97]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]
test_scores[0].push(100)
#=> [97, 76, 79, 93, 100]
test_scores
#=> [[97, 76, 79, 93, 100], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81], [100, 99, 98, 97]]

```

Using this similar syntax, you can add or remove elements from the entire nested array or from a specific nested element.

```ruby
test_scores.pop
#=> [100, 99, 98, 97]
test_scores[0].pop
#=> 100
test_scores
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
```

Iterating over a nested array
---

Let’s break down how to iterate over a nested array using the `#each_with_index method`

```ruby
teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end
#=> Row:0 = ["Adams", "Baker", "Clark", "Davis"]
#=> Row:1 = ["Jones", "Lewis", "Lopez", "Moore"]
#=> Row:2 = ["Perez", "Scott", "Smith", "Young"]
#=> [["Adams", "Baker", "Clark", "Davis"], ["Jones", "Lewis", "Lopez", "Moore"], ["Perez", "Scott", "Smith", "Young"]]
```

To iterate over the individual elements inside of each row, you will need to nest another enumerable method inside.

```ruby
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
```

Although these examples are a bit contrived, it is important to note that if we only need each teacher’s name it would be beneficial to use `#flatten` before iterating.

```ruby
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
```

 Using the above nested array of test scores, let’s determine if any student scored higher than 80 on everything.

```ruby
test_scores = [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]
#=> [[97, 76, 79, 93], [79, 84, 76, 79], [88, 67, 64, 76], [94, 55, 67, 81]]

test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end
#=> false
```

What do you think will happen if we switch `#any?` and `#all?`?

```ruby
test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end
#=> true
```

Nested Hashes
---

Nested hashes are a very common way to store complex associated data.

```ruby
vehicles = {
  alice: {year: 2019, make: "Toyota", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}
```

Accessing Data - Hashes
---

Accessing a specific element in a nested hash is very similar to a nested array. It is as simple as calling `hash[:x][:y]`, where `:x` is the key of the hash and `:y` is the key of the nested hash.

```ruby
vehicles[:alice][:year]
#=> 2019
vehicles[:blake][:make]
#=> "Volkswagen"
vehicles[:caleb][:model]
#=> "Accord"
```

Similar to nested arrays, if you try to access a key in a nonexistent nested hash, it will raise an `NoMethodError`, therefore you may want to use the `#dig` method. As expected, if you try to access a nonexistent key in an existing nested hash, it will return nil.

```ruby
vehicles[:zoe][:year]
#=> NoMethodError
vehicles.dig(:zoe, :year)
#=> nil
vehicles[:alice][:color]
#=> nil
vehicles.dig(:alice, :color)
#=> nil
```

Adding and Removing Data - Hashes
---

You can add more nested hashes, just like a regular hash.

```ruby
vehicles[:dave] = {year: 2021, make: "Ford", model: "Escape"}
#=> {:year=>2021, :make=>"Ford", :model=>"Escape"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
```

You can also add an element to one of the nested hashes.

```ruby
vehicles[:dave][:color] = "red"
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :blake=>{:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
```

Deleting one of the nested hashes will be just like a regular hash.

```ruby
vehicles.delete(:blake)
#=> {:year=>2020, :make=>"Volkswagen", :model=>"Beetle"}
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape", :color=>"red"}}
```

To delete one of the key/value pairs inside of a nested hash, you first specify the key of the hash .i.e `vehicles[:dave]`

```ruby
vehicles[:dave].delete(:color)
#=> "red"
vehicles
#=> {:alice=>{:year=>2019, :make=>"Toyota", :model=>"Corolla"}, :caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
```

Methods
---

1. `#select`

```ruby
vehicles.select { |name, data| data[:year] >= 2020 }
#=> {:caleb=>{:year=>2020, :make=>"Honda", :model=>"Accord"}, :dave=>{:year=>2021, :make=>"Ford", :model=>"Escape"}}
```

2. `#collect`

```ruby
vehicles.collect { |name, data| name if data[:year] >= 2020 }
#=> [nil, :caleb, :dave]

```

3. `#compact`

```ruby
vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact
#=> [:caleb, :dave]
```

Using `#collect` and `#compact` returns the data that we want.

4. `#filter_map`

Method that combines the functionality of the #compact and #collect methods

```ruby
vehicles.filter_map { |name, data| name if data[:year] >= 2020 }
#=> [:caleb, :dave]
```

More Resources
---

[Nested Hash Iteration](https://learn.co/lessons/nested-hash-iteration)

[Manipulating Output](https://stackoverflow.com/questions/50529389/manipulating-output-from-an-array-of-nested-hashes-in-ruby)

