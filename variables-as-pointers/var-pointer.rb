# a = "hi there"
# b = a
# a = "not here"


# a = "hi there"
# b = a
# a << ", Bob"

a = [1, 2, 3, 3]
b = a
c = a.uniq

# puts 'a:', a
# puts 'b:', b
# puts 'c:', c

def test(b)
    b.map {|letter| "I like the letter: #{letter}"}
  end
  
  a = ['a', 'b', 'c']
  test(a)
#   puts a

