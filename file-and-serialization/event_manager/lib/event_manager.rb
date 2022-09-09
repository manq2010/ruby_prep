# to download a file

# curl -o event_attendees.csv https://raw.githubusercontent.com/TheOdinProject/curriculum/main/ruby/files_and_serialization/event_attendees.csv

# head -10 filename

puts 'EventManager initialized.'

contents = File.read('event_attendees.csv')
puts contents

p '##### Read the File Line By Line ######'

lines = File.readlines('event_attendees.csv')
lines.each do |line|
  puts line
end

p '###### Display the First Names of All Attendees ######'

lines = File.readlines('event_attendees.csv')
lines.each do |line|
  columns = line.split(',')
  p columns
end

p '#########'

lines = File.readlines('event_attendees.csv')
lines.each do |line|
  columns = line.split(',')
  name = columns[2]
  puts name
end

p '########## Skipping the Header Row ############'

lines = File.readlines('event_attendees.csv')
lines.each do |line|
  next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"

  columns = line.split(',')
  name = columns[2]
  puts name
end

p '########  next if ######'

lines = File.readlines('event_attendees.csv')
row_index = 0
lines.each do |line|
  row_index += 1
  next if row_index == 1

  columns = line.split(',')
  name = columns[2]
  puts name
end

p '######### Array#each_with_index. ##########'

lines = File.readlines('event_attendees.csv')
lines.each_with_index do |line, index|
  next if index == 0

  columns = line.split(',')
  name = columns[2]
  puts name
end