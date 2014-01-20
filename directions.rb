require 'open-uri'
require 'json'

puts "Enter an origin address: "

origin = gets
origin = origin.chomp
origin = origin.squeeze(' ')
origin = origin.gsub(' ','+')

puts "Enter a destination address: "

destination = gets
destination = destination.chomp
destination = destination.squeeze(' ')
destination = destination.gsub(' ','+')

result = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&sensor=true").read
result = JSON.parse(result)

result['routes'].each do |resultComponents|
  resultComponents['legs'].each do |leg|
    puts "Total travel time driving: " + leg['distance']['text']
    puts "Total distance traveled: " + leg['duration']['text']
  end
end
