if 1 < 2
    puts "Hot diggity, 1 is less than 2!"
  end

  puts "Hot diggity damn, 1 is less than 2" if 1 < 2


puts  5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
puts 5.eql?(5)   #=> true

a = 5
b = 5
# puts a.equal?(b) #=> true

# puts 5 <=> 10    #=> -1
# puts 10 <=> 10   #=> 0
# puts 10 <=> 5    #=> 1

if 1 < 2 && 5 < 6
    # puts "Party at Kevin's!"
  end
  
  # This can also be written as
  if 1 < 2 and 5 < 6
    # puts "Party at Kevin's!"
  end

  if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
    # puts "Party at Kevin's!"
  end
  
  # This can also be written as
  if 10 < 2 or 5 < 6
    # puts "Party at Kevin's!"
  end


# Case Statements

grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end

grade = 'A'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
  puts future_bank_account_balance
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end


# Unless Statements

age = 17
unless age < 18
    puts "Get a job."
  end

age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end


# Ternary Operator

age = 17
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."

age = 19
if age < 18
  response = "You still have your entire life ahead of you."
else
  response = "You're all grown up."
end

puts response #=> "You're all grown up."