require 'csv'

csv = CSV.read('db/fixtures/development/brewery.csv')
csv.each do |line|
  name = line[0]
  post_code = line[1]
  address = line[2]
  phone_number = line[3]
  email = line[4]
  url = line[5]
  is_confirmed = line[6]

  Brewery.seed do |s|
    s.name = name
    s.post_code = post_code
    s.address = address
    s.phone_number = phone_number
    s.email = email
    s.url = url
    s.is_confirmed = is_confirmed
  end
end
