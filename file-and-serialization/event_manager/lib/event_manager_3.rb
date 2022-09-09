require 'csv'
require 'google/apis/civicinfo_v2'

# civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
# civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5, '0')[0..4]
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   legislators = civic_info.representative_info_by_address(
#     address: zipcode,
#     levels: 'country',
#     roles: ['legislatorUpperBody', 'legislatorLowerBody']
#   )
#   legislators = legislators.officials

#   puts "#{name} #{zipcode} #{legislators}"
# end

p '#### Adding an exception ####'

# require 'csv'
# require 'google/apis/civicinfo_v2'

# civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
# civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5, '0')[0..4]
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   begin
#     legislators = civic_info.representative_info_by_address(
#       address: zipcode,
#       levels: 'country',
#       roles: %w[legislatorUpperBody legislatorLowerBody]
#     )
#     legislators = legislators.officials
#   rescue StandardError
#     'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end

#   puts "#{name} #{zipcode} #{legislators}"
# end

p '# Collecting the Names of the Legislators #'

# def clean_zipcode1(zipcode)
#   zipcode.to_s.rjust(5, '0')[0..4]
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode1(row[:zipcode])

#   begin
#     legislators = civic_info.representative_info_by_address(
#       address: zipcode,
#       levels: 'country',
#       roles: %w[legislatorUpperBody legislatorLowerBody]
#     )
#     legislators = legislators.officials
#     legislator_names = legislators.map(&:name)
#   rescue StandardError
#     'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end

#   puts "#{name} #{zipcode} #{legislator_names}"
# end

# legislator_names = legislators.map do |legislator|
#   legislator.name
# end

# legislator_names = legislators.map(&:name)

p '## Cleanly Displaying Legislators ##'

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5, '0')[0..4]
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   begin
#     legislators = civic_info.representative_info_by_address(
#       address: zipcode,
#       levels: 'country',
#       roles: %w[legislatorUpperBody legislatorLowerBody]
#     )
#     legislators = legislators.officials

#     legislator_names = legislators.map(&:name)

#     legislators_string = legislator_names.join(', ')
#   rescue StandardError
#     'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end

#   puts "#{name} #{zipcode} #{legislators_string}"
# end

p '## Moving Displaying Legislators to a Method ##'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    )
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislator_names.join(', ')
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
end
