require 'csv'
puts 'EventManager initialized.'

p 'Iteration 2: Cleaning up our Zip Codes'

p '## Pseudocode for Cleaning Zip Codes ##'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  # if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than five digits, truncate it to the first five digits
  # if the zip code is less than five digits, add zeros to the front until it becomes five digits

  puts "#{name} #{zipcode}"
end

# p '#### Handling Bad and Good Zip Codes #####'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]

#   if zipcode.length < 5
#     zipcode = zipcode.rjust(5, '0')
#   elsif zipcode.length > 5
#     zipcode = zipcode[0..4]
#   end

#   puts "#{name} #{zipcode}"
# end

p '#### Handling Missing Zip Codes ###'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  if zipcode.nil?
    zipcode = '00000'
  elsif zipcode.length < 5
    zipcode = zipcode.rjust(5, '0')
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  end

  puts "#{name} #{zipcode}"
end

p '### Moving Clean Zip Codes to a Method ###'

def clean_zipcode(zipcode)
  if zipcode.nil?
    '00000'
  elsif zipcode.length < 5
    zipcode.rjust(5, '0')
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end

p '### Refactoring Clean Zip Codes ####'

def clean_zipcode2(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_number(homephone)
  results = homephone.gsub!(/[^\d]/, '').to_s

  # if results[0]

  if results[0] == '1' && results.length == 11
    results[1..10]
  elsif results.length == 10
    results[0..9]
  else
    'Bad Number!'
  end

  # case results.length
  # when results.length == 10
  #   results
  # when results.length > 11 && results[0] == '1'
  #   results[1..10]
  # else
  #   'homephone'
  # end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode2(row[:zipcode])
  phonenumber = clean_phone_number(row[:homephone])
  puts "#{name} #{zipcode} #{phonenumber}"
end
