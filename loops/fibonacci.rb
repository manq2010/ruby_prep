# fibonacci.rb

def fibonacci(number)
    if number < 2
      number
    else
      fibonacci(number - 1) + fibonacci(number - 2)
    end
  end
  
  puts fibonacci(6)


  def count_to_zero(number)
    if number <= 0
      puts number
    else
      puts number
      count_to_zero(number-1)
    end
  end
  
  count_to_zero(10)
  count_to_zero(20)
  count_to_zero(-3)

  x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end