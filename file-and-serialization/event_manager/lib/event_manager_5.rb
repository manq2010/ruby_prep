require 'erb'
require 'google/apis/civicinfo_v2'
require 'csv'

# meaning_of_life = 42

# # <%= ruby code will execute and show output %>
# # <% ruby code will execute but not show output %>

# question = 'The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life %>'
# template = ERB.new question

# results = template.result(binding)
# puts results

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials
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

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  #   name = row[:first_name]

  #   zipcode = clean_zipcode(row[:zipcode])

  #   legislators = legislators_by_zipcode(zipcode)

  #   form_letter = erb_template.result(binding)
  #   puts form_letter

  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end
