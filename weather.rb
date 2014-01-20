require 'open-uri'
require 'json'

puts "Please enter an address: "

address = gets
address = address.chomp
address = address.squeeze(' ')
address = address.gsub(' ','+')

result = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=true").read
result = JSON.parse(result)

lat = 0
long = 0

result['results'].each do |resultComponents|
  lat = resultComponents['geometry']['location']['lat']
  long = resultComponents['geometry']['location']['lng']
end

weather = open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}").read
weather = JSON.parse(weather)

puts "%.2f F" % (((weather['main']['temp'] - 273.15) * 9) / 5 + 32)
