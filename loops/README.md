
# Loops

## Loop

```ruby
i = 0
loop do
  puts "i is #{i}"
  i += 1
  break if i == 10
end

```

## While Loop

```ruby
i = 0
while i < 10 do
 puts "i is #{i}"
 i += 1
end
```

```ruby
while gets.chomp != "yes" do
  puts "Will you go to prom with me?"
end
```

# Until Loop

The `until` loop is the opposite of the `while` loop.  A `while` loop continues for as long as the condition is `true`, whereas an `until` loop continues for as long as the condition is `false`

```ruby
i = 0
until i >= 10 do
 puts "i is #{i}"
 i += 1
end
```

```ruby
until gets.chomp == "yes" do
  puts "Will you go to prom with me?"
end
```

# Ranges

A Range object represents a collection of values that are between given begin and end values.

```ruby

(1..5)      # inclusive range: 1, 2, 3, 4, 5
(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d')  # a, b, c, d

```

* A `range literal`:

```ruby
# Ranges that use '..' to include the given end value.
(1..4).to_a      # => [1, 2, 3, 4]
('a'..'d').to_a  # => ["a", "b", "c", "d"]
# Ranges that use '...' to exclude the given end value.
(1...4).to_a     # => [1, 2, 3]
('a'...'d').to_a # => ["a", "b", "c"]
```

* A range may be created using method `Range.new`:

```ruby
# Ranges that by default include the given end value.
Range.new(1, 4).to_a     # => [1, 2, 3, 4]
Range.new('a', 'd').to_a # => ["a", "b", "c", "d"]
# Ranges that use third argument +exclude_end+ to exclude the given end value.
Range.new(1, 4, true).to_a     # => [1, 2, 3]
Range.new('a', 'd', true).to_a # => ["a", "b", "c"]
```

## Endless Ranges¶ ↑

An *endless range* has a definite begin value, but a nil end value. Such a range includes all values from the begin value.

```ruby
r = (1..)         # => 1..
r.end             # => nil
r.include?(50)    # => true

Range.new(1, nil) # => 1..
```

The literal for an endless range may be written with either two dots or three.

```ruby
r0 = (1..)           # => 1..
r1 = (1...)          # => 1...
r0.begin == r1.begin # => true
r0.end == r1.end     # => true
r0 == r1             # => false
```

An endless range may be used to slice an array:

```ruby
a = [1, 2, 3, 4]
r = (2..) # => 2..
a[r]      # => [3, 4]

```

Method each for an endless range calls the given block indefinitely:

```ruby
a = []
r = (1..)
r.each do |i|
  a.push(i) if i.even?
  break if i > 10
end
a # => [2, 4, 6, 8, 10]
```

## Beginless Ranges¶ ↑

A `beginless range` has a definite end value, but a `nil` begin value. Such a range includes all values up to the end value.

```ruby
r = (..4)               # => nil..4
r.begin                 # => nil
r.include?(-50)         # => true
r.include?(4)           # => true

r = (...4)              # => nil...4
r.include?(4)           # => false

Range.new(nil, 4)       # => nil..4
Range.new(nil, 4, true) # => nil...4
```

A beginless range may be used to slice an array:

```ruby
a = [1, 2, 3, 4]
r = (..2) # => nil...2
a[r]      # => [1, 2]

```

## Ranges and Other Classes¶ ↑

An object may be put into a range if its class implements instance method `<=>`. Ruby core classes that do so include `Array`, `Complex`, `File::Stat`, `Float`, `Integer`, `Kernel`, `Module`, `Numeric`, `Rational`, `String`, `Symbol`, and `Time`.

```ruby
t0 = Time.now         # => 2021-09-19 09:22:48.4854986 -0500
t1 = Time.now         # => 2021-09-19 09:22:56.0365079 -0500
t2 = Time.now         # => 2021-09-19 09:23:08.5263283 -0500
(t0..t2).include?(t1) # => true
(t0..t1).include?(t2) # => false
```

A range can be iterated over only if its elements implement instance method succ. Ruby core classes that do so include `Integer`, `String`, and `Symbol` (but not the other classes mentioned above).

### Iterator methods include

* In Range itself: `each`, `step`, and `%`
* Included from module Enumerable: `each_entry`, `each_with_index`, `each_with_object`, `each_slice`, `each_cons`, and `reverse_each`.

```ruby
a = []
(1..4).each {|i| a.push(i) }
a # => [1, 2, 3, 4]
```

## Ranges and User-Defined Classes¶ ↑

A user-defined class that is to be used in a range must implement instance `<=>`; see `Integer#<=>`. To make iteration available, it must also implement instance method `succ`; see `Integer#succ`.

The class below implements both `<=>` and `succ`, and so can be used both to construct ranges and to iterate over them

```ruby
# Represent a string of 'X' characters.
class Xs
  include Comparable
  attr_accessor :length
  def initialize(n)
    @length = n
  end
  def succ
    Xs.new(@length + 1)
  end
  def <=>(other)
    @length <=> other.length
  end
  def to_s
    sprintf "%2d #{inspect}", @length
  end
  def inspect
    'X' * @length
  end
end

r = Xs.new(3)..Xs.new(6) #=> XXX..XXXXXX
r.to_a                   #=> [XXX, XXXX, XXXXX, XXXXXX]
r.include?(Xs.new(5))    #=> true
r.include?(Xs.new(7))    #=> false
```

First, what's elsewhere. Class Range:

* Inherits from class Object.
* Includes module Enumerable, which provides dozens of additional methods.

Here, class Range provides methods that are useful for:

* Creating a Range
* Querying
* Comparing
* Iterating
* Converting

# Methods

## Methods for Creating a Range¶ ↑

|`::new`|
|:--|
|Returns a new range.|

## Methods for Querying¶ ↑

|`begin`|
|:--|
|Returns the begin value given for self.|

|`bsearch`|
|:--|
|Returns an element from self selected by a binary search.|

|`count`|
|:--|
|Returns a count of elements in self.|

|`end`|
|:--|
|Returns the end value given for self.|

|`exclude_end?`|
|:--|
|Returns whether the end object is excluded.|

|`first`|
|:--|
|Returns the first elements of self.|

|`hash`|
|:--|
|Returns the integer hash code.|

|`last`|
|:--|
|Returns the last elements of self.|

|`max`|
|:--|
|Returns the maximum values in self.|

|`min`|
|:--|
|Returns the minimum values in self.|

|`minmax`|
|:--|
|Returns the minimum and maximum values in self.|

|`size`|
|:--|
|Returns the count of elements in self.|

## Methods for Comparing¶ ↑

|`#==`|
|:--|
|Returns whether a given object is equal to self (uses #==).|

|`===`|
|:--|
|Returns whether the given object is between the begin and end values.|

|`cover?`|
|:--|
|Returns whether a given object is within self.|

|`eql?`|
|:--|
|Returns whether a given object is equal to self (uses eql?).|

|`include? (aliased as member?)`|
|:--|
|Returns whether a given object is an element of self.|

## Methods for Iterating¶ ↑

|`%`|
|:--|
|Requires argument n; calls the block with each n-th element of self.|

|`each`|
|:--|
|Calls the block with each element of self.

|`step`|
|:--|
|Takes optional argument n (defaults to 1); calls the block with each n-th element of self.

## Methods for Converting¶ ↑

|inspect|
|:--|
|Returns a string representation of self (uses inspect).|

|to_a (aliased as entries)|
|:--|
|Returns elements of self in an array.|

|to_s|
|:--|
|Returns a string representation of self (uses to_s).|

## Public Class Methods

[Public Class Methods](https://ruby-doc.org/core-3.1.2/Range.html#top)

## Public Instance Methods

[Public Instance Methods](https://ruby-doc.org/core-3.1.2/Range.html#top)

---

# Other stuff

Author: Mancoba Sihlongonyane <manq2010@gmail.com>
