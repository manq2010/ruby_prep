# Conditional Logic

## Basic Conditional Statement

The general syntax of an `if` statement is shown here:

```ruby
if statement_to_be_evaluated == true
  # do something awesome...
end

if 1 < 2
  puts "Hot diggity, 1 is less than 2!"
end
#=> Hot diggity, 1 is less than 2!

puts "Hot diggity damn, 1 is less than 2" if 1 < 2

```

You don’t even need the end statement. Nice and concise!

## Adding else and elsif

We often want to check a condition and run some code if it’s true but then run some other code if it’s false. This is done with an `if...else` statement.

```ruby

if attack_by_land == true
  puts "release the goat"
else
  puts "release the shark"
end
```

Enter the `if...elsif...else` statement!

```ruby
if attack_by_land == true
  puts "release the goat"
elsif attack_by_sea == true
  puts "release the shark"
else
  puts "release Kevin the octopus"
end
```

## Boolean Logic

To determine whether an expression evaluates to `true` or `false`, you’ll need a comparison operator. There are several provided by Ruby:

* [✔] `==` (equals) returns `true` if the values compared are equal.

* [✔] `!=` (not equal) returns `true` if the values compared are not equal.

* [✔] `>` (greater than) returns `true` if the value on the left of the operator is larger than the value on the right.

* [✔] `<` (less than) returns `true` if the value on the left of the operator is smaller than the value on the right.

* [✔] `>=` (greater than or equal to) returns `true` if the value on the left of the operator is larger than or equal to the value on the right.

* [✔] `#eql?` checks both the value type and the actual value it holds

```ruby
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true

```

* [✔] `#equal?` checks whether both values are the exact same object in memory. This can be slightly confusing because of the way computers store some values for efficiency. Two variables pointing to the same number will usually return `true`.

```ruby
a = 5
b = 5
a.equal?(b) #=> true

a = "hello"
b = "hello"
a.equal?(b) #=> false

```

This happens because computers can’t store strings in the same efficient way they store numbers. Although the values of the variables are the same, the computer has created two separate string objects in memory.

* [✔] `<=>` (spaceship operator) returns the following:
  * `-1` if the value on the left is less than the value on the right;
  * `0` if the value on the left is equal to the value on the right; and
  * `1` if the value on the left is greater than the value on the right

```ruby
5 <=> 10    #=> -1
10 <=> 10   #=> 0
10 <=> 5    #=> 1
```
