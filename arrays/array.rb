Array.new               #=> []
Array.new(3)            #=> [nil, nil, nil]
Array.new(3, 7)         #=> [7, 7, 7]
Array.new(3, true)      #=> [true, true, true]

str_array = ["This", "is", "a", "small", "array"]

str_array[0]            #=> "This"
str_array[1]            #=> "is"
str_array[4]            #=> "array"
str_array[-1]           #=> "array"
str_array[-2]           #=> "small"

str_array = ["This", "is", "a", "small", "array"]

str_array.first         #=> "This"
str_array.first(2)      #=> ["This", "is"]
str_array.last(2)       #=> ["small", "array"]

num_array = [1, 2]

num_array.push(3, 4)      #=> [1, 2, 3, 4]
num_array << 5            #=> [1, 2, 3, 4, 5]
num_array.pop             #=> 5
num_array                 #=> [1, 2, 3, 4]


num_array = [2, 3, 4]

num_array.unshift(1)      #=> [1, 2, 3, 4]
num_array.shift           #=> 1
num_array                 #=> [2, 3, 4]

num_array = [1, 2, 3, 4, 5, 6]

a1 = num_array.map {|element| element.class }

# print num_array.methods

num_array.pop(3)          #=> [4, 5, 6]
num_array  
num_array.shift(2)        #=> [1, 2]
num_array                 #=> [3]


a = [1, 2, 3]
b = [3, 4, 5]

a + b         #=> [1, 2, 3, 3, 4, 5]
a - b 
a.concat(b)   #=> [1, 2, 3, 3, 4, 5]

[1, 1, 1, 2, 2, 3, 4] - [1, 4]  #=> [2, 2, 3]


print [].empty?               #=> true
print [[]].empty?             #=> false
print [1, 2].empty?           #=> false
print '----'
print [1, 2, 3].length        #=> 3
print '-----'
print [1, 2, 3].reverse       #=> [3, 2, 1]
print '-----------'
print [1, 2, 3].include?(3)   #=> true
print [1, 2, 3].include?("3") #=> false
print '--------------------'
print [1, 2, 3].join          #=> "123"
print [1, 2, 3].join("-")     #=> "1-2-3"
print [1, 2, 3].join(" ")    #=> "1 2 3"
