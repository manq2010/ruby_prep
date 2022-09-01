<h1 align="center">Variables</h1>

**Variables** are used to store information to be referenced and manipulated in a computer program. They also provide a way of labeling data with a descriptive name, so our programs can be understood more clearly by the reader and ourselves. It is helpful to think of variables as containers that hold information. Their sole purpose is to label and store data in memory. This data can then be used throughout your program.

## Assigning Value to Variables

When you assign a variable, you use the `=` symbol. The name of the variable goes on the left and the value you want to store in the variable goes on the right.

```ruby
first_name = 'Joe'
puts first_name  #=> "Joe"

age #=> 18
age = age + 4
age #=> 22

age = 18
age -= 2  #=> 16

cash = 10
cash *= 2 #=> 20

temperature = 40
temperature /= 10 #=> 4

```

*Note: Make sure you don't confuse the assignment operator (`=`) with the equality operator (`==`). The individual `=` symbol assigns value while the `==` symbol checks if two things are equal.*

## How to Name Variables

Variable names should always be lowercase, and multiple words that make up a variable name should be split by an underscore. This is known as **snake_case.**

```ruby
# bad
a = 19
string = "John"

# good
age = 19
name = "John"
can_swim = false
```

## Variables are References

The information you name with a variable is stored in memory on your computer, so a variable is effectively a reference or a pointer to that address in memory. This is important to know as it can sometimes be the cause of unexpected behavior from your code.

```ruby
desired_location = "Barcelona"
johns_location = desired_location

desired_location  #=> "Barcelona"
johns_location    #=> "Barcelona"
```

Unexpected behavior happens if the string “Barcelona” that is stored in memory is modified. One way to modify a string is to use the `upcase!` method, instead of the safe upcase method. If the string is modified using `johns_location.upcase!` then `desired_location` will also reflect that change:

```ruby
johns_location.upcase!  #=> "BARCELONA"

desired_location        #=> "BARCELONA"
johns_location          #=> "BARCELONA"
```

## Getting Data from a User

```ruby
name = gets
```

# Variable Scope

## Variable Scope and Method Definitions

```ruby

name = 'Somebody Else'

def print_full_name(first_name, last_name)
  name = first_name + ' ' + last_name
  puts name
end

print_full_name 'Peter', 'Henry'   # prints Peter Henry
print_full_name 'Lynn', 'Blake'    # prints Lynn Blake
print_full_name 'Kim', 'Johansson' # prints Kim Johansson
puts name                          # prints Somebody Else

```

## Variable Scope and Blocks

A block is a piece of code that follows a method's invocation, delimited by either curly braces `{}` or `do/end`:

```ruby
total = 0
[1, 2, 3, 4, 6, 8, 10].each { |number| total += number }
puts total # 34

total = 0
[1, 2, 3, 4, 6, 8].each do |number|
  total += number
end
puts total # 24
```

In the examples above, `{ |number| ... }` is a block, as is `do |number| ... end`. Though they look different, the behavior is identical. In both cases, the code can access and modify variables that are defined outside of the block. Thus, both blocks can access and modify `total`. However, any variables initialized inside the block (such as `number`) can't be accessed by the outer code.

**Inner scope can access variables initialized in an outer scope, but not vice versa.**

# Types of Variables

Before we move on, you should be aware that there are five types of variables. `Constants`, `global variables`, `class variables`, `instance variables`, and `local variables`.

**Constants** are declared by capitalizing every letter in the variable's name, per Ruby convention. They are used for storing data that never needs to change. While most programming languages do not allow you to change the value assigned to a constant, Ruby does. It will however throw a warning letting you know that there was a previous definition for that variable.

Example of a constant declaration:

```ruby
MY_CONSTANT = 'I am available throughout your app.'
```

**Global variables** are declared by starting the variable name with the dollar sign (`$`). These variables are available throughout your entire app, overriding all scope boundaries. Rubyists tend to stay away from global variables as there can be unexpected complications when using them.

Example of a global variable declaration:

```ruby
$var = 'I am also available throughout your app.'
```

**Class variables** are declared by starting the variable name with two `@` signs. These variables are accessible by instances of your class, as well as the class itself. When you need to declare a variable that is related to a class, but each instance of that class does not need its own value for this variable, you use a class variable. Class variables must be initialized at the class level, outside of any method definitions. They can then be altered using class or instance method definitions.

Example of a class variable declaration:

```ruby
@@instances = 0

```

**Instance variables** are declared by starting the variable name with one `@` sign. These variables are available throughout the current instance of the parent class. Instance variables can cross some scope boundaries, but not all of them. You will learn more about this when you get to OOP topics, and should not use instance variables until you know more about them.

Example of an instance variable declaration:

```ruby
@var = 'I am available throughout the current instance of this class.'
```

**Local variables** are the most common variables you will come across and obey all scope boundaries. These variables are declared by starting the variable name with neither `$` nor `@`, as well as not capitalizing the entire variable name.

Example of a local variable declaration:

```ruby
var = 'I must be passed around to cross scope boundaries.'
```
