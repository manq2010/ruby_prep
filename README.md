[![Actions Status: Ubuntu](https://github.com/ruby/ruby/workflows/Ubuntu/badge.svg)](https://github.com/ruby/ruby/actions?query=workflow%3A"Ubuntu")

# ruby_prep

## How to load a file into interactive ruby console (IRB)?

`irb -r ./your_file.rb` if it is in the same directory.
`require './foo.rb'` alternatively

# Basic Data Types

1. Ruby’s basic data types:
1. numbers (integers and floats
1. strings
1. symbol
1. Booleans (true, false, and nil).

## Numbers

**Numbers** are represented many ways in Ruby. The most basic form of a number is called an **integer**. It is represented by the whole number only, with no decimal point. A more complex form of a number is called a **float**. A float is a number that contains a decimal.

### Operations

```ruby
# Addition
1 + 1   #=> 2

# Subtraction
2 - 1   #=> 1

# Multiplication
2 * 2   #=> 4

# Division
10 / 5  #=> 2

# Exponent
2 ** 2  #=> 4
3 ** 4  #=> 81

# Modulus (find the remainder of division)
8 % 2   #=> 0  (8 / 2 = 4; no remainder)
10 % 4  #=> 2  (10 / 4 = 2 with a remainder of 2)
```

### Modulo vs. Remainder

The `#remainder` method computes and returns the remainder of an integer division operation:

```ruby
irb :001 > 16.remainder(5)
=> 1

irb :001 > 16.divmod(5)
=> [3, 1]
```

### Integers and Floats

```ruby
17 / 5    #=> 3, not 3.4
17 / 5.0  #=> 3.4
```

### Converting Number Types

```ruby
# To convert an integer to a float:
13.to_f   #=> 13.0

# To convert a float to an integer:
13.0.to_i #=> 13
13.9.to_i #=> 13
```

### Some Useful Number Methods

```ruby
6.even? #=> true
7.even? #=> false

6.odd? #=> false
7.odd? #=> true
```

## Strings

A **string** is a list of characters in a specific sequence

### Concatenation

```ruby
# With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"
```

### Substrings

```ruby
"hello"[0]      #=> "h"

"hello"[0..1]   #=> "he"

"hello"[0, 4]   #=> "hell"

"hello"[-1]     #=> "o"
```

### Escape characters

```ruby
\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
\'  #=> Single quotation mark

```

### Interpolation

```ruby
name = "Odin"

puts "Hello, #{name}" #=> "Hello, Odin"
puts 'Hello, #{name}' #=> "Hello, #{name}"
```

### Common String Methods

## Common String Methods

### #capitalize

```ruby
"hello".capitalize #=> "Hello"
```

### #include?

```ruby
"hello".include?("lo")  #=> true

"hello".include?("z")   #=> false
```

### #upcase

```ruby
"hello".upcase  #=> "HELLO"
```

### #downcase

```ruby
"Hello".downcase  #=> "hello"
```

### #empty?

```ruby
"hello".empty?  #=> false

"".empty?       #=> true
```

### #length

```ruby
"hello".length  #=> 5
```

### #reverse

```ruby
"hello".reverse  #=> "olleh"
```

### #split

```ruby
"hello world".split  #=> ["hello", "world"]

"hello".split("")    #=> ["h", "e", "l", "l", "o"]
```

### #strip

```ruby
" hello, world   ".strip  #=> "hello, world"
```

Others

```ruby
"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"
```

### Converting other objects to strings

```ruby
5.to_s              #=> "5"

nil.to_s            #=> ""

:symbol.to_s        #=> "symbol"

'12'.to_i           #=> 12

'4 hi there'.to_i   #=> 4

'hi there 4'.to_i   #=> 0

```

## Symbols

### Create a Symbol

```ruby
:my_symbol

```

### Symbols vs. Strings

Ruby **symbols** are created by placing a colon (`:`) before a word.

```ruby
"string" == "string"  #=> true

"string".object_id == "string".object_id  #=> false

:symbol.object_id == :symbol.object_id    #=> true
```

## Booleans

### True and False

The Boolean values `true` and `false` represent exactly what you think they do: `true` represents something that is true, and `false` represents something that is false.

### Nil

In Ruby, `nil` represents “nothing”. Everything in Ruby has a return value. When a piece of code doesn’t have anything to return, it will return `nil`. This is pretty abstract, but it will make more sense as you learn and use Ruby more.

# The Basics

[The Basics link](https://launchschool.com/books/ruby/read/basics)

# The Variables

[The Variables link @ LaunchSchool](https://launchschool.com/books/ruby/read/variables)
