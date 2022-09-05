p '############## includes?'

numbers = [5, 6, 7, 8]

p numbers.include?(6)
#=> true

p numbers.include?(3)
#=> false

friends = %w[Sharon Leo Leila Brian Arun]

invited_list = friends.select { |friend| friend != 'Brian' }

p invited_list.include?('Brian')
#=> false

p '############# any?'

numbers = [21, 42, 303, 499, 550, 811]

p numbers.any? { |number| number > 500 }
#=> true

p numbers.any? { |number| number < 20 }
#=> false

p '############## all?'

fruits = %w[apple banana strawberry pineapple]

p fruits.all? { |fruit| fruit.length > 3 }
#=> true

p fruits.all? { |fruit| fruit.length > 6 }
#=> false

p '############ none?'

fruits = %w[apple banana strawberry pineapple]

p fruits.none? { |fruit| fruit.length > 10 }
#=> true

p fruits.none? { |fruit| fruit.length > 6 }
#=> false
