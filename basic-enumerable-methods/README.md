© Mancoba Sihlongonyane <br>
(Maintainer)

## Basic Enumerable Methods

**[Enumerables]**(<https://ruby-doc.org/core-3.1.2/Enumerable.html>) are a set of convenient built-in methods in Ruby that are included as part of both arrays and hashes. There are some iteration patterns that you’ll find yourself doing again and again, such as `transforming`, `searching` for, and `selecting` subsets of elements in your collections. Enumerables were designed to make implementing these iteration patterns (and therefore your life as a developer) much, much easier.

Table of Contents
=================

* [Life Before Enumerables](#life-before-enumerables)
* [The each Method](#the-each-method)
* [The each_with_index Method](#the-eachwithindex-method)
* [The map Method](#the-map-method)
* [The select Method](#the-select-method)
* [The reduce Method](#the-reduce-method)
* [Bang Methods](#bang-methods)
* [Return Values of Enumerables](#return-values-of-enumerables)
* [Assignment](#assignment)
  * [Ruby Explained: Map, Select, and Other Enumerable Methods](#ruby-explained-map-select-and-other-enumerable-methodshttpswwweriktrautmancompostsruby-explained-map-select-and-other-enumerable-methods)
  * [How to Use The Ruby Map Method](#how-to-use-the-ruby-map-method)

Life Before Enumerables
----------------------

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
```

Using the `#select` enumerable method (which we’ll get into much more detail about later), you could change the above code to this:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

or even better and more to the point:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.reject { |friend| friend == 'Brian' }
 #=> ["Sharon", "Leo", "Leila", "Arun"]
```

You just cut down what was previously an 8 line program down to 2 lines. Amazing! Imagine all the time you will save sorting your invite lists now.

The each Method
---------------

`#each` is the granddaddy of the enumerable methods. It’s a bit like Chuck Norris: it can do anything. As you’ll see throughout this lesson, though, just because you can use `#each` to do just about anything doesn’t mean it’s always the best or most efficient tool for the job.

Calling `#each` on an array will iterate through that array and will yield each element to a code block, where a task can be performed:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]
```

* `|friend|` - block variable
* `{ |friend| puts "Hello, " + friend }`- a block

What if the block you want to pass to a method requires more logic than can fit on one line? It starts to become less readable and looks unwieldy. For multi-line blocks, the commonly accepted best practice is to change up the syntax to use `do...end`instead of `{...}`:

```ruby
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

#=> The new number is 2.
#=> The new number is 4.

#=> [1, 2]

```

`#each` also works for hashes with a bit of added functionality. By default, each iteration will yield both the key and value individually or together (as an array) to the block depending on how you define your block variable:

```ruby
my_hash = { "one" => 1, "two" => 2 }

my_hash.each { |key, value| puts "#{key} is #{value}" }

# one is 1
# two is 2
#=> { "one" => 1, "two" => 2}

my_hash.each { |pair| puts "the pair is #{pair}" }

# the pair is ["one", 1]
# the pair is ["two", 2]
#=> { "one" => 1, "two" => 2}
```

The each_with_index Method
--------------------------

This method is nearly the same as #each, but it provides some additional functionality by yielding two **block variables** instead of one as it iterates through an array. The first variable’s value is the element itself, while the second variable’s value is the index of that element within the array. This allows you to do things that are a bit more complex.

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
```

Just like with the `#each` method, `#each_with_index` returns the original array it’s called on.

The map Method
--------------

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']
```

The `#map` method (also called `#collect`) transforms each element from an array according to whatever block you pass to it and returns the transformed elements in a new array. `#map` may seem confusing at first, but it is extremely useful.

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

Using `#map` and `#gsub`

```ruby
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map { |item| item.gsub('medium', 'extra large') }
#=> ["extra large Big Mac", "extra large fries", "extra large milkshake"]
```

```ruby
salaries = [1200, 1500, 1100, 1800]

salaries.map { |salary| salary - 700 }
#=> [500, 800, 400, 1100]
```

The select Method
-----------------

The `#select` method (also called `#filter`) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to `true`.

First, let’s explore how we would accomplish the same thing using `#each`:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

friends.each do |friend|
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

invited_list
 #=> ["Sharon", "Leo", "Leila", "Arun"]

```

Using our shiny new #select method, this code can be simplified down to two lines:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

 #=> ["Sharon", "Leo", "Leila", "Arun"]
 ```

 Let’s use `#select` to see who’s coming

```ruby
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
```

The reduce Method
-----------------

The `#reduce` method (also called `#inject`) is possibly the most difficult-to-grasp enumerable for new coders. The idea is simple enough, though: it reduces an array or hash down to a single object. You should use `#reduce` when you want to get an output of a single value.

A classic example of when `#reduce` is useful is obtaining the sum of an array of numbers. First, let’s explore how we would achieve this using `#each`:

```ruby
my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

sum
#=> 26

```

now using #reduce method

```ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce { |sum, number| sum + number }
# => 26
```

We can also set a different initial value for the accumulator by directly passing in a value to the `#reduce` method.

```ruby
my_numbers = [5, 6, 7, 8]

my_numbers.reduce(1000) { |sum, number| sum + number }
#=> 1026
```

```ruby
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end
#=> {"Bob's Dirty Burger Shack"=>2, "St. Mark's Bistro"=>1}
```

Bang Methods
------------

If you wanted to change your `friends` array instead, you could use the bang method `#map!`:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map! { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`

friends
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

As you’ll recall from the Methods lesson, **bang methods** can be easily identified by their exclamation marks (`!`) at the end of their name. All bang methods are **destructive** and modify the object they are called on. Many of the enumerable methods that return new versions of the array or hash they were called on have a bang method version available, such as `#map!` and `#select!`.

It’s best practice to avoid using these methods, however, as you or a future developer working on your code may need the original version.

Return Values of Enumerables
---

Ways to re-use the result of an enumerable method

One option is to put the result of an enumerable method into a local variable:

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends = friends.select { |friend| friend != 'Brian' }

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends
#=> ["Sharon", "Leo", "Leila", "Arun"]
```

```ruby
An even better option would be to wrap your enumerable method in a method definition:

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

def invited_friends(friends)
  friends.select { |friend| friend != 'Brian' }
end

friends
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_friends(friends)
 #=> ["Sharon", "Leo", "Leila", "Arun"]
 ```

Assignment
---

#### [Ruby Explained: Map, Select, and Other Enumerable Methods](https://www.eriktrautman.com/posts/ruby-explained-map-select-and-other-enumerable-methods)

```ruby
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
```

#### [How to Use The Ruby Map Method](rubyguides.com/2018/10/ruby-map-method/)
