def even_odd(number)
  return 'A number was not entered.' unless number.is_a? Numeric

  if number.even?
    'That is an even number.'
  else
    'That is an odd number.'
  end
end

even_odd(20) #=>  That is an even number.
even_odd('Ruby') #=>  A number was not entered.

def return_squared(number)
  number * number
end

x = return_squared(20) #=> 400
y = 100
sum = x + y #=> 500

puts "The sum of #{x} and #{y} is #{sum}."
# => The sum of 400 and 100 is 500.

# Chaining Methods

phrase = %w[be to not or be to]

puts phrase.reverse.join(' ').capitalize
#=> "To be or not to be"

whisper = 'HELLO EVERYBODY'

puts whisper.downcase #=> "hello everybody"
puts whisper #=> "HELLO EVERYBODY"

puts whisper.downcase! #=> "hello everybody"
puts whisper #=> "hello everybody"

def say(words = 'hey')
  puts words + '.'
end

say
say('hello')
say 'Hello'
say('hi')
say 'Hi'
say('how are you')
say("I'm fine")

# Method invocation with a block

[1, 2, 3].each do |num|
  puts num
end

def some_method(_number)
  number = 7 # this is implicitly returned by the method
end

a = 5
some_method(a)
puts a

a = [1, 2, 3]

# Example of a method definition that mutates its argument permanently
def mutate(array)
  array.pop
end

p "Before mutate method: #{a}"
mutate(a)
p "After mutate method: #{a}"

a = [1, 2, 3]

# Example of a method definition that does not mutate the caller
def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{a}"
no_mutate(a)
p "After no_mutate method: #{a}"

# Chained Methods

def add_three(n)
  n + 3
end

add_three(5).times { puts "this should print #{add_three(5)} times" }

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(num1, num2)
  num1 * num2
end

puts multiply(add(20, 45), subtract(80, 10))
puts
puts add(subtract(80, 10), multiply(subtract(20, 6), add(30, 5)))

# Ruby Case & Ranges
case capacity
when 0
  'You ran out of gas.'
when 1..20
  'The tank is almost empty. Quickly, find a gas station!'
when 21..70
  'You should be ok for now.'
when 71..100
  'The tank is almost full.'
else
  "Error: capacity has an invalid value (#{capacity})"
end

# variable
var = 5;

# ternary statement
a = (var > 2) ? true : false 
puts a
