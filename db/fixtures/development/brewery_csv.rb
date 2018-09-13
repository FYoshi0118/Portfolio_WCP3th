require 'csv'

csv = CSV.read('db/fixtures/development/brewery.csv')
csv.each do |line|
  id = line[0]
  name = line[1]
  post_code = line[2]
  address = line[3]
  phone_number = line[4]
  email = line[5]
  url = line[6]
  is_confirmed = line[7]

  Brewery.seed do |s|
    s.id = id
    s.name = name
    s.post_code = post_code
    s.address = address
    s.phone_number = phone_number
    s.email = email
    s.url = url
    s.is_confirmed = is_confirmed
  end
end
