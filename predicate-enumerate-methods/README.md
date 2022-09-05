#### predicate enumerable methods

Table of Contents
===

* [The include? Method](#the-include-method)
* [The any? Method](#the-any-method)
* [The all? Method](#the-all-method)
* [The none? Method](#the-none-method)
* [How to Use Ruby Any, All, None & One](#how-to-use-ruby-any-all-none--one)

##### The include? Method

```ruby
numbers = [5, 6, 7, 8]
element = 6
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end

result
# => true

element = 3
result = false

numbers.each do |number|
  if number == element
    result = true
  end
end

result
#=> false

```

Using `#include?`, this code can be greatly simplified:

```ruby
numbers = [5, 6, 7, 8]

numbers.include?(6)
#=> true

numbers.include?(3)
#=> false


friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

invited_list = friends.select { |friend| friend != 'Brian' }

invited_list.include?('Brian')
#=> false
```

##### The any? Method

```ruby
numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number > 500
    result = true
  end
end

result
#=> true

numbers = [21, 42, 303, 499, 550, 811]
result = false

numbers.each do |number|
  if number < 20
    result = true
  end
end

result
#=> false

```

Using `#any?`, this code can be greatly simplified:

```ruby
numbers = [21, 42, 303, 499, 550, 811]

numbers.any? { |number| number > 500 }
#=> true

numbers.any? { |number| number < 20 }
#=> false
```

##### The all? Method

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 3
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = fruits.length == matches.length
end

result
#=> false
```

Using `#all?`, this code can be greatly simplified:

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.all? { |fruit| fruit.length > 3 }
#=> true

fruits.all? { |fruit| fruit.length > 6 }
#=> false
```

Special note to keep in mind while debugging: `#all?` will return `true` by default unless the block returns `false` or `nil`. So if you call `#all?` on an empty array or hash (i.e., there are no elements for the block to evaluate), it will return `true`.

##### The none? Method

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 10
    matches.push(fruit)
  end

  result = matches.length == 0
end

result
#=> true

fruits = ["apple", "banana", "strawberry", "pineapple"]
matches = []
result = false

fruits.each do |fruit|
  if fruit.length > 6
    matches.push(fruit)
  end

  result = matches.length == 0
end

result
#=> false

```

Using `#none?`, this can be greatly simplified:

```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.none? { |fruit| fruit.length > 10 }
#=> true

fruits.none? { |fruit| fruit.length > 6 }
#=> false

```

##### [How to Use Ruby Any, All, None & One](https://www.rubyguides.com/2018/10/any-all-none-one/)

```ruby
[:orange, :apple, :coconut].any?(Symbol)
# true
[1,2,3].all?(1..10)
# true

["a"].one?
# true
[].one?
# false
[nil].one?
# false


["a", 1, {}].one? { |obj| obj.kind_of?(Hash) }
# true

score_list.one? { |key, value| value == perfect_score }

```
