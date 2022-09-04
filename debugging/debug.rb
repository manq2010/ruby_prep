def isogram?(string)
  p string
  original_length = string.length

  p original_length
  #   string_array = string.downcase.split
  #   Indeed, we didn’t use #split correctly, as this particular creates an array with the given string rather than creating an array of characters of the given string. Why? By default, if we didn’t provide arguments, #split will divide the string using whitespace as the delimiter. Try running the above code in a REPL or IRB using #split('') instead, and you’ll see the difference.

  string_array = string.downcase.split('')

  p string_array
  unique_length = string_array.uniq.length

  p unique_length
  p original_length == unique_length
end

isogram?('Odin')

#=> false

puts "Using puts:"
puts []
p "Using p:"
p []
