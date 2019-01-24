require_relative 'train'
require_relative 'route'
require_relative 'station'

def move_forward(train)
  puts 'Move forward'
  train.move_forward
  puts 'Current station:'
  puts train.current_station.name
end
# new stations
station_1 = Station.new('Mendeleevskaya')
station_2 = Station.new('Universitet')
station_3 = Station.new('Shabolovskaya')
station_4 = Station.new('Yasenevo')
station_5 = Station.new('Smolenskaya')

# new route
route = Route.new(station_1, station_5)

# new train
train = Train.new(666, 'passanger', 6)

# stations
puts 'All stations:'
route.print_all_way_stations

puts '***Add new stations***'
route.add_station(station_2)
route.add_station(station_3)
route.add_station(station_4)

puts 'All stations:'
route.print_all_way_stations

# trains speed
puts 'Current speed:'
puts train.speed
puts '***Gain speed***'
train.gain_speed
puts 'Current speed:'
puts train.speed
puts '***Gain speed***'
train.gain_speed
puts 'Current speed:'
puts train.speed
puts '***Slow down***'
train.slow_down
puts 'Current speed:'
puts train.speed

# trains route
train.take_route(route)


puts 'Current station:'
puts train.current_station.name
puts 'Move back'
train.move_back
puts 'Current station:'
puts train.current_station.name

move_forward(train)
move_forward(train)
move_forward(train)
move_forward(train)
move_forward(train)
