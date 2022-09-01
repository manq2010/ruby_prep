# Getting Data from a User

# name = gets
# puts name

# names = gets.chomp
# puts names

# Variable Scope and Method Definitions

name = 'Somebody Else'

def print_full_name(first_name, last_name)
  name = first_name + ' ' + last_name
  puts name
end

# print_full_name 'Mancoba', 'Sihlongonyane'
# print_full_name 'Lynn', 'Blake'    # prints Lynn Blake
# print_full_name 'Kim', 'Johansson' # prints Kim Johansson
# puts name                          # prints Somebody Else


# Variable Scope and Blocks

total = 0
[1, 2, 3, 4, 6, 8, 10].each { |number| total += number }
# puts total # 34


total = 0
[1, 2, 3, 4, 6, 8].each do |number|
  total += number
end
# puts total # 24

# a = 5             # variable is initialized in the outer scope

3.times do |n|    # method invocation with a block
  a = 3           # is a accessible here, in an inner scope?
end

# puts a

3.times { |n| a = 3 }

# 

# a = 5

3.times do |n|    # method invocation with a block
  a = 3
  b = 5           # b is initialized in the inner scope
end

# puts a
# puts b            # is b accessible here, in the outer scope?

a = 1

arr = [1, 2, 3]

for i in arr do
  a = i      # a is initialized here
end

# puts a       # is it accessible here?

## Exercise

puts "What is your name?"
name_get = gets.chomp
puts name_get + ', How are you?'