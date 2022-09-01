def x(*)
    5
  end
  
  p x 1, '', [1,2,3], {1 => '1'}    # => 5

  def x *;
    5
  end
  
  p x 1, '', [3,4,5], {5 => '5'}

  print "Hello World"
  print "I love drinking coffee"
  puts "Hello World"
  puts "I love drinking coffee"