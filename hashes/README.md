## Hashes

Ruby hashes are more advanced collections of data and are similar to objects in JavaScript

A Hash maps each of its unique keys to a specific value.

A Hash has certain similarities to an Array, but:

* An Array index is always an Integer.
* A Hash key can be (almost) any object.

### Creating Hashes

Let’s dive in and create a hash!

```ruby
my_hash = {
  "a random word" => "ahoy",
  "Dorothy's math test score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}
```

The values of a hash can be a number, a string, an array, or even another hash. Keys and values are associated with a special operator called a **hash rocket**: `=>`.

```ruby
my_hash = Hash.new
my_hash               #=> {}

hash = { 9 => "nine", :six => 6 }

```

### Accessing Values

```ruby
shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}

shoes["summer"]   #=> "sandals"
```

If you try to access a key that doesn’t exist in the hash, it will return nil:

```ruby
shoes["hiking"]   #=> nil
shoes.fetch("hiking")   #=> KeyError: key not found: "hiking"

shoes.fetch("hiking", "hiking boots") #=> "hiking boots"

```

### Adding and Changing Data

```ruby
shoes["fall"] = "sneakers"

shoes     #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}
```

You can also use this approach to change the value of an existing key.

```ruby
shoes["summer"] = "flip-flops"
shoes     #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}
```

### Removing Data

Deleting data from a hash is simple with the hash’s #delete method, which provides the cool functionality of returning the value of the key-value pair that was deleted from the hash.

```ruby
shoes.delete("summer")    #=> "flip-flops"
shoes                     #=> {"winter"=>"boots", "fall"=>"sneakers"}
```

### Methods

A couple of useful methods that are specific to hashes are the `#keys` and `#values` methods

```ruby
books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

books.keys      #=> ["Infinite Jest", "Into the Wild"]
books.values    #=> ["David Foster Wallace", "Jon Krakauer"]
```

#### [Hash Resources on Ruby Documentation](https://ruby-doc.org/core-3.1.2/Hash.html)

#### [Ruby Explained: Hashes](https://www.eriktrautman.com/posts/ruby-explained-hashes)

### Merging Two Hashes

```ruby
hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
hash1.merge(hash2)      #=> { "a" => 100, "b" => 254, "c" => 300 }
```

### Symbols as Hash Keys

```ruby
# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}
# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}
```

Both create symbol keys that are accessed the same way

```ruby
american_cars[:ford]    #=> "Mustang"
japanese_cars[:honda]   #=> "Accord"
```

### Iterating Over Hashes

```ruby
# iterating_over_hashes.rb

person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end
```

#### [Launch School Resourses](https://launchschool.com/books/ruby/read/hashes)
