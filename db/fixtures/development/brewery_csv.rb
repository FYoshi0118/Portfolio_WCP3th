require 'csv'

csv = CSV.read('db/fixtures/development/brewery.csv')
csv.each do |line|
  id = line[0]
  name = line[1]
  post_code = line[2]
  address_prefecture = line[3]
  address_city = line[4]
  phone_number = line[5]
  email = line[6]
  url = line[7]
  is_confirmed = line[8]

  Brewery.seed do |s|
    s.id = id
    s.name = name
    s.post_code = post_code
    s.address_prefecture = address_prefecture
    s.address_city = address_city
    s.phone_number = phone_number
    s.email = email
    s.url = url
    s.is_confirmed = is_confirmed
  end
end
