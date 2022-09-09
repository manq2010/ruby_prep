
Iteration 0: Loading a File
---

#### Read the File Contents

```ruby
puts 'EventManager initialized.'

contents = File.read('event_attendees.csv')
puts contents

################

lines = File.readlines('event_attendees.csv')
lines.each_with_index do |line, index|
  next if index == 0

  columns = line.split(',')
  name = columns[2]
  puts name
end

```

Iteration 1: Parsing with CSV
---

[Ruby Standard Library](https://rubydoc.info/stdlib)

```ruby
require 'csv'
puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]
  puts "#{name} #{zipcode}"
end
```

Iteration 2: Cleaning up our Zip Codes
---

* [String#length](https://rubydoc.info/stdlib/core/String#length-instance_method) - returns the length of the string.
* [`tring#rjust](https://rubydoc.info/stdlib/core/String#rjust-instance_method) - to pad the string with zeros.
* [String#slice](https://rubydoc.info/stdlib/core/String#slice-instance_method) - to create sub-strings either through the slice method or the array-like notation []

```ruby
require 'csv'

puts 'EventManager initialized.'

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
```

#### Moving Clean Zip Codes to a Method

```ruby
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

puts 'EventManager initialized.'

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
```

#### Refactoring Clean Zip Codes

```ruby
$ nil.to_s
=> ""

$ "123456".rjust(5, '0')
=> "123456"

$ "12345"[0..4]
=> "12345"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end
```

Iteration 3: Using Google’s Civic Information
---

#### Accessing the API

[Take a close look at this sample URL for accessing the Civic Information AP](https://www.googleapis.com/civicinfo/v2/representatives?address=80203&levels=country&roles=legislatorUpperBody&roles=legislatorLowerBody&key=AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw)

Here’s how it breaks down:

* `https://` : Use the Secure HTTP protocol
* `www.googleapis.com/civicinfo/v2/` : The API server address on the internet
* `representatives` : The method called on that server
* `?` : Parameters to the method
  * `address=80203` : The zipcode we want to lookup
  * `levels=country` : The level of government we want to select
  * `roles=legislatorUpperBody` : Return the representatives from the Senate
  * `roles=legislatorLowerBody` : Returns the representatives from the House
  * `key=AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw` : A registered API Key to authenticate our requests

When we’re accessing the `representatives` method of their API, we’re sending in a `key` which is the string that identifies JumpstartLab as the accessor of the API, then we’re selecting the data we want returned to us using the `address`, `levels`, and `roles` criteria. Try modifying the address with your own zipcode and load the page.

[JSON Formatter](https://jsonformatter.org/json-pretty-print)

#### Installing the Google API Client

```
$ gem install google-api-client
Successfully installed google-api-client-0.15.0
1 gem installed
```

#### Showing All Legislators in a Zip Code

```ruby
require 'csv'
require 'google/apis/civicinfo_v2'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
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

  legislators = civic_info.representative_info_by_address(
    address: zipcode,
    levels: 'country',
    roles: ['legislatorUpperBody', 'legislatorLowerBody']
  )
  legislators = legislators.officials

  puts "#{name} #{zipcode} #{legislators}"
end
```

Running our application, we find an error.

```
$ ruby lib/event_manager.rb
/ruby-2.4.0/gems/google-api-client-0.15.0/lib/google/apis/core/http_command.rb:218:in 'check_status': parseError: Failed to parse address (Google::Apis::ClientError)
```

[Exception](https://ruby-doc.org/core-3.1.2/Exception.html). We can add a begin and rescue clause to the API search to handle any errors

```ruby
require 'csv'
require 'google/apis/civicinfo_v2'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
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

  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    )
    legislators = legislators.officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end

  puts "#{name} #{zipcode} #{legislators}"
end
```

#### Moving Displaying Legislators to a Method

```ruby
require 'csv'
require 'google/apis/civicinfo_v2'


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
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    )
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislator_names.join(", ")
  rescue
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
```

Iteration 4: Form Letters
---

```html
<html>
<head>
  <meta charset='UTF-8'>
  <title>Thank You!</title>
</head>
<body>
  <h1>Thanks FIRST_NAME!</h1>
  <p>Thanks for coming to our conference.  We couldn't have done it without you!</p>

  <p>
    Political activism is at the heart of any democracy and your voice needs to be heard.
    Please consider reaching out to your following representatives:
  </p>

  <table>
    <tr><th>Legislators</th></tr>
    <tr><td>LEGISLATORS</td></tr>
  </table>
</body>
</html>
```

#### Storing our template to a file

```ruby
form_letter = %{
  <html>
  <head>
    <title>Thank You!</title>
  </head>
  <body>
    <h1>Thanks FIRST_NAME!</h1>
    <p>Thanks for coming to our conference.  We couldn't have done it without you!</p>

    <p>
      Political activism is at the heart of any democracy and your voice needs to be heard.
      Please consider reaching out to your following representatives:
    </p>

    <table>
      <tr><th>Legislators</th></tr>
      <tr><td>LEGISLATORS</td></tr>
    </table>
  </body>
  </html>
}
```

Instead of including the template within our application, we will instead load the template using the same File tools we used at the beginning of the exercise.

* Create a file named ‘form_letter.html’ in the root of your project directory.
* Copy the html template defined above into that file and save it.

```ruby
template_letter = File.read('form_letter.html')
```

#### Replacing with `gsub` and `gsub!`

For each of our attendees we want to replace the `FIRST_NAME` and `LEGISLATORS` with their respective values.

* We need to find all instances of `FIRST_NAME` and replace them with the individual’s first name.
* We need to find all instances of `LEGISLATORS` and replace them with the individual’s representatives.

[gsub](https://rubydoc.info/stdlib/core/String#gsub-instance_method) returns a new copy of the original string with the values replaced and [gsub!](https://rubydoc.info/stdlib/core/String#gsub%21-instance_method) will replace the values in the original string.

```ruby
template_letter = File.read('form_letter.html')

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  personal_letter = template_letter.gsub('FIRST_NAME', name)
  personal_letter.gsub!('LEGISLATORS', legislators)

  puts personal_letter
end
```

The above template manipulation could have been written with just `gsub`:

```ruby
personal_letter = template_letter.gsub('FIRST_NAME', name)
personal_letter = personal_letter.gsub('LEGISLATORS', legislators)
```

Ruby’s ERB
---

Ruby defines a template language named ERB.

> ***"ERB provides an easy to use but powerful templating system for Ruby. Using ERB, actual Ruby code can be added to any plain text document for the purposes of generating document information details and/or flow control."***

```ruby
<%= ruby code will execute and show output %>
<% ruby code will execute but not show output %>

require 'erb'

meaning_of_life = 42

question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life %>"
template = ERB.new question

results = template.result(binding)
puts results
```

* What is `binding`?

The method [binding](https://rubydoc.info/stdlib/core/Kernel#binding-instance_method) returns a special object. This object is an instance of [Binding](https://rubydoc.info/stdlib/core/Binding). An instance of binding knows all about the current state of variables and methods within the given scope. In this case, binding knows about the variable meaning_of_life.

#### Defining an ERB Template

Update a new template as below **form_letter.html**

```html
<html>
<head>
  <meta charset='UTF-8'>
  <title>Thank You!</title>
</head>
<body>
  <h1>Thanks <%= name %></h1>
  <p>Thanks for coming to our conference.  We couldn't have done it without you!</p>

  <p>
    Political activism is at the heart of any democracy and your voice needs to be heard.
    Please consider reaching out to your following representatives:
  </p>

  <table>
    <% if legislators.kind_of?(Array) %>
      <th>Name</th><th>Website</th>
        <% legislators.each do |legislator| %>
        <tr>
          <td><%= "#{legislator.name}" %></td>
          <td><%= "#{legislator.urls.join}" unless legislator.urls.nil? %></td>
        </tr>
        <% end %>
    <% else %>
      <th></th>
      <td><%= "#{legislators}" %></td>
    <% end %>
  </table>
</body>
</html>
```

#### Outputting form letters to a file

* Assign an ID for the attendee
* Create an output folder
* Save each form letter to a file based on the id of the attendee

```ruby
contents.each do |row|
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
```

* Assign an ID for the attendee - The first column does not have a name like the other columns, so we fall back to using the index value.
* Create an output folder - We make a directory named “output” if a directory named “output” does not already exist.

```ruby
Dir.mkdir('output') unless Dir.exist?('output')
```

* Save each form letter to a file based on the id of the attendee

[File#open](https://rubydoc.info/stdlib/core/File#open-class_method) allows us to open a file for reading and writing. The first parameter is the name of the file. The second parameter is a flag that states how we want to open the file. The w states we want to open the file for writing. If the file already exists it will be destroyed.

Afterwards we actually send the entire form letter content to the file object. The `file` object responds to the message `puts`. The method [IO#puts](https://rubydoc.info/stdlib/core/IO#puts-instance_method), from which the file object inherits, is similar to [Kernel#puts](https://rubydoc.info/stdlib/core/Kernel#puts-instance_method) which we have been using up to this point.

#### Moving Form Letter Generation to a Method

```ruby
require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
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
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end
```
