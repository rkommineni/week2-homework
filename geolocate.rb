require 'open-uri'
require 'json'

puts "Enter an address, city or zipcode: "

address = gets
address = address.chomp
address = address.squeeze(' ')
address = address.gsub(' ','+')

result = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true").read
result = JSON.parse(result)

result['results'].each do |resultComponents|
  puts "Latitude: " + resultComponents['geometry']['location']['lat'].to_s
  puts "Longitude: " + resultComponents['geometry']['location']['lng'].to_s
end
