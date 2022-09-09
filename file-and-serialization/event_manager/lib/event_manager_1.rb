require 'csv'
puts 'EventManager initialized.'
p 'Iteration 1: Parsing with CSV'

p '#########Switching over to use the CSV Library###########'

contents = CSV.open('event_attendees.csv', headers: true)
contents.each do |row|
  name = row[2]
  puts name
end

p '##### Accessing Columns by their Names ####'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  puts name
end

p '### Displaying the Zip Codes of All Attendees ###'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  phonenumber = row[:homephone]
  puts "#{name} #{zipcode} #{phonenumber.gsub!(/[^\d]/, '')}"
end
