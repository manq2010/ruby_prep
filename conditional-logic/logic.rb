if 1 < 2
    puts "Hot diggity, 1 is less than 2!"
  end

  puts "Hot diggity damn, 1 is less than 2" if 1 < 2


puts  5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
puts 5.eql?(5)   #=> true

a = 5
b = 5
puts a.equal?(b) #=> true

puts 5 <=> 10    #=> -1
puts 10 <=> 10   #=> 0
puts 10 <=> 5    #=> 1