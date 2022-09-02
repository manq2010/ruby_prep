### Methods

This concept allows for what programmers refer to as the DRY approach to programming: Don’t Repeat Yourself. Recycling sections of code instead of repeating them throughout your programs can make your program more readable and manageable.

> *"Many languages distinguish between functions, which have no associated object, and methods, which are invoked on a receiver object. Because Ruby is a purely object-oriented language, all methods are true methods and are associated with at least one object."*

#### Ruby’s Built-in Methods

Methods are typically called by adding .method_name after an instance of the object that contains that method.

```ruby
"anything".reverse

puts "anything" #=> anything
```

In this case, `#reverse` is a built-in method for [String](https://ruby-doc.org/core-3.1.2/String.html) objects.

[Kernel module](https://ruby-doc.org/core-3.1.2/Kernel.html) through the [Object class](https://ruby-doc.org/core-3.1.2/Object.html)

It’s worth noting that in most languages, arguments are passed to methods by wrapping them in parentheses `()`. In Ruby, however, the parentheses are generally optional. We could rewrite the above code as `puts("anything")`, which Ruby would interpret in the same way.

#### Creating a Method

```ruby
def my_name
  "Joe Smith"
end

puts my_name    #=> "Joe Smith"
```

Let’s break this example down:

* `def` is a built-in keyword that tells Ruby that this is the start of a method definition.
* `my_name` is the name of your new method.
* `"Joe Smith"` is the code inside the method body.
* `end` is a built-in keyword that tells Ruby that this is the end of the method definition.
* To call the method, you simply need to use its name.

#### Method Names

Your method names can use numbers, capital letters, lowercase letters, and the special characters `_`, `?`, `!`, and `=`.

Check [here](https://stackoverflow.com/questions/10542354/what-are-the-restrictions-for-method-names-in-ruby) for more details.

Here are some things you are not allowed to do with your method names:

* You cannot name your method one of Ruby’s approximately 40 reserved words, such as `end`, `while`, or `for`. Checkout the full list [here](http://www.java2s.com/Code/Ruby/Language-Basics/Rubysreservedwords.htm).
* You cannot use any symbols other than `_`, `?`, `!`, and `=`.
* You cannot use `?`, `!`, or `=` anywhere other than at the end of the name.
* You cannot begin a method name with a number.

```ruby
method_name      # valid
_name_of_method  # valid
1_method_name    # invalid
method_27        # valid
method?_name     # invalid
method_name!     # valid
begin            # invalid (Ruby reserved word)
begin_count      # valid
```

#### Parameters and Arguments

**Parameters** are variables that your method will receive when it is called

```ruby
def greet(name)
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!
```

**Parameters** act as placeholder variables in the template of your method, whereas **arguments** are the actual variables that get passed to the method when it is called. Thus, in the example above, `name` is a `parameter` and `"John"` is an `argument`.

##### Default Parameters

```ruby
def greet(name = "stranger")
  "Hello, " + name + "!"
end

puts greet("Jane") #=> Hello, Jane!
puts greet #=> Hello, stranger!

```

#### What Methods Return

Ruby is one of the few languages that offers **implicit return** for methods, which means that a Ruby method will return the last expression that was evaluated even without the `return` keyword.

```ruby
def even_odd(number)
  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(16) #=>  That is an even number.
puts even_odd(17) #=>  That is an odd number.
```

For example, an explicit return can be useful when you want to write a method that checks for input errors before continuing.

```ruby
def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number % 2 == 0
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(20) #=>  That is an even number.
puts even_odd("Ruby") #=>  A number was not entered.
```

##### Difference Between `puts` and `return`

* `puts` is a method that prints whatever argument you pass it to the console.
* `return` is the final output of a method that you can use in other places throughout your code.

```ruby
def return_squared(number)
  number * number
end

x = return_squared(20) #=> 400
y = 100
sum = x + y #=> 500

puts "The sum of #{x} and #{y} is #{sum}."
# => The sum of 400 and 100 is 500.
```

#### Chaining Methods

```ruby
phrase = ["be", "to", "not", "or", "be", "to"]

puts phrase.reverse.join(" ").capitalize
#=> "To be or not to be"
```

```ruby
def add_three(n)
  n + 3
end

add_three(5).times { puts 'this should print 8 times'}
```

#### Predicate Methods

You will sometimes encounter built-in Ruby methods that have a question mark (`?`) at the end of their name, such as `even?`, `odd?`, or `between?`. These are all **predicate** methods, which is a naming convention that Ruby uses for methods that return a Boolean, that is, they return either `true` or `false`.

```ruby
puts 5.even?  #=> false
puts 6.even?  #=> true
puts 17.odd?  #=> true

puts 12.between?(10, 15)  #=> true
```

You can also create your own method with a `?` at the end of its name to indicate that it returns a Boolean.

#### Bang Methods

```ruby
whisper = "HELLO EVERYBODY"

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"
```

Another way to do this type of reassignment is with **bang methods**, which are denoted with an exclamation mark (`!`) at the end of the method name.

By adding a `!` to the end of your method, you indicate that this method performs its action and simultaneously overwrites the value of the original object with the result.

```ruby
puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"

```

Writing `whisper.downcase!` is the equivalent of writing `whisper = whisper.downcase`.


##### [Lauchschool link for Methods](https://launchschool.com/books/ruby/read/methods)

##### [Ruby link on Method](https://ruby-doc.org/core-3.1.2/Method.html)