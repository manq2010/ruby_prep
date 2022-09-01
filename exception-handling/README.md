# Exception Handling

**Exception handling**is a specific process that deals with errors in a manageable and predictable way. The main thing we want to make you aware of at this point, is how exception handling works and what it looks like. The reserved word rescue will show up a lot in your Ruby career so it's better to know what it is sooner than later.

When your programs are interacting with the real world, there is a large amount of unpredictability. If a user enters bad information or a file-manipulating process gets corrupted, your program needs to know what to do when it runs into these exceptional conditions.

Ruby has an `Exception` class that makes handling these errors much easier. It also has a syntactic structure using the reserved words `begin`, `rescue`, and `end` to signify exception handling. The basic structure looks like this.

```ruby
# exception_example.rb

begin
  # perform some dangerous operation
rescue
  # do this if operation fails
  # for example, log the error
end

```

We've used a `begin/rescue/end` block to handle any exceptions that may happen within our block. In this example, we have a `nil` value in our array. Therefore, when we go to call `.length` on `nil` we get an error. When an exception, or error, is raised, the `rescue` block will execute and then the program will continue to run as it normally would. If we didn't have the `rescue` block there, our program would stop once it hit the exception and we would lose the rest of our print-out.

You can also use the `rescue` reserved word in-line like so:

```ruby
# inline_exception_example.rb

zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!"
puts "After each call"
```

It does so because it isn't possible to call the `each` method on an Integer which is the value of the `zero` variable. If we remove the `rescue` block, the second `puts` method will not execute because the program will exit when it runs into the error. You can see why the word "rescue" is relevant here. We are effectively rescuing our program from coming to a grinding halt. If we give this same code the proper variable, our `rescue` block never gets executed.

We can also rescue pre-existing errors when we are writing our code. Let's look at doing something like that with a `divide` method.

```ruby
# divide.rb

def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)

```

Here we are rescuing the `ZeroDivisionError` and saving it into a variable `e`. We then have access to the `message` method that the `ZeroDivisionError` object has available
