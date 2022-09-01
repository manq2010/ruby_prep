# divide.rb

def divide(number, divisor)
    begin
      answer = number / divisor
    rescue ZeroDivisionError => e
    puts e.message
    puts "An error of type #{e.class} happened, message is #{e.message}"
    puts e.full_message(highlight: true, order: :top)
    end
  end
  
  puts divide(16, 4)
  puts divide(4, 0)
  puts divide(14, 7)