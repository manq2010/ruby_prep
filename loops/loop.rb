i = 0
loop do
#   puts "i is #{i}"
  i += 1
  break if i == 10
end

ii = 0
while ii < 5 do
#  puts "ii is #{ii}"
 ii += 1
end

# while gets.chomp != "yes" do
#     # puts "Will you go to prom with me?"
#   end

  i = 0
until i >= 10 do
#  puts "i is #{i}"
 i += 1
end

# until gets.chomp == "yes" do
#     # puts "Will you go to prom with me?"
# end

# Ranges

r = (1..5)      # inclusive range: 1, 2, 3, 4, 5
puts r
puts r.end
puts r.include?(5)
puts Range.new(1, 10)

(1...5)     # exclusive range: 1, 2, 3, 4

# We can make ranges of letters, too!
('a'..'d')  # a, b, c, d

# Ranges that use '..' to include the given end value.
 (1..4).to_a      # => [1, 2, 3, 4]
 ('a'..'d').to_a  # => ["a", "b", "c", "d"]
# Ranges that use '...' to exclude the given end value.
 (1...4).to_a     # => [1, 2, 3]
 ('a'...'d').to_a # => ["a", "b", "c"]


# Endless Ranges

r = (1..)         # => 1..
r.end             # => nil
r.include?(50)    # => true

Range.new(1, nil) # => 1..



r0 = (1..)           # => 1..
r1 = (1...)          # => 1...
r0.begin == r1.begin # => true
r0.end == r1.end     # => true
r0 == r1             # => false

a = [1, 2, 3, 4]
r = (2..) # => 2..

a = []
r = (1..)
r.each do |i|
  a.push(i) if i.even?
  break if i > 10
end
puts a # => [2, 4, 6, 8, 10]
print a

# Beginless

r = (..4)               # => nil..4
r.begin                 # => nil
r.include?(-50)         # => true
r.include?(4)           # => true

r = (...4)              # => nil...4
r.include?(4)           # => false

Range.new(nil, 4)       # => nil..4
Range.new(nil, 4, true) # => nil...4


# For Loop

for i in 0..5
  puts "#{i} zombies incoming!"
end

5.times do
  puts "Hello, world!"
end

5.times do |number|
  puts "Alternative fact number #{number}"
end


5.upto(10) {|num| print "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) {|num| print "#{num} " }   #=> 10 9 8 7 6 5

# conditional_while_loop

x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end

# conditional_while_loop_with_next

x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end