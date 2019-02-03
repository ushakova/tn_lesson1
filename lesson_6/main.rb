require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'route'
require_relative 'station'

@all_stations = []
@all_trains = []
@route = nil

def main_menu
  puts 'Выберите дейтсвие:'
  puts '1. Создать станцию'
  puts '2. Создать поезд'
  puts '3. Создать маршрут'
  puts '4. Добавить станцию к маршруту'
  puts '5. Убрать станцию из маршрута'
  puts '6. Назначить маршрут поезду'
  puts '7. Прицепить вагон к поезду'
  puts '8. Отцепить вагон от поезда'
  puts '9. Передвинуть поезд вперёд по маршруту'
  puts '10. Передвинуть поезд назад по маршруту'
  puts '11. Посмотреть список станций'
  puts '12. Посмотреть список поездов на станции'
  puts '13. Выход'
  choise = gets.to_i
  sub_menu(choise)
end

def sub_menu(choise)
  case choise
  when 1 then create_station
  when 2 then create_train
  when 3 then create_route
  when 4 then add_station_to_route
  when 5 then delete_station_from_route
  when 6 then set_route_to_train
  when 7 then attach_wagon_to_train
  when 8 then detach_wagon_from_train
  when 9 then move_forward
  when 10 then move_back
  when 11 then print_stations_list
  when 12 then print_trains_list_on_station
  when 13 then return
  end
  main_menu
end

def create_station
  puts 'Введите название станции'
  name = gets.chomp
  @all_stations << Station.new(name)

rescue => e
  puts e.message
  retry
end

def create_train
  puts 'Выберите тип поезда:'
  puts '1. Пассажирский'
  puts '2. Грузовой'
  choise = gets.to_i
  puts 'Номер поезда:'
  number = gets.chomp
  case choise
  when 1 then @all_trains << PassengerTrain.new(number)
  when 2 then @all_trains << CargoTrain.new(number)
  else create_train
  end
rescue => e
  puts e.message
  retry
end

def create_route
  return if @route || @all_stations.size < 2
  print_stations_list
  puts 'Выберите начальную станцию:'
  first_station = gets.to_i
  puts 'Выберите конечную станцию:'
  last_station = gets.to_i
  if first_station != last_station
    @route = Route.new(@all_stations[first_station - 1], @all_stations[last_station - 1])
  else
    create_route
  end
end

def add_station_to_route
  return if @all_stations.empty? || @route.nil?
  station = @all_stations[chose_station - 1]
  @route&.add_station(station)
end

def delete_station_from_route
  return if @route.stations.size == 2 || @route.nil?
  @route.print_all_way_stations
  puts 'Выберите станцию:'
  choise = gets.to_i
  @route&.delete_station(@all_stations[choise - 1]) if choise <= @route.stations.size
end

def set_route_to_train
  return unless @route
  train = chose_train
  train&.take_route(@route)
end

def attach_wagon_to_train
  train = chose_train
  wagon = train&.type == 'Passanger' ? PassengerWagon.new : CargoWagon.new
  train&.attach(wagon)
end

def detach_wagon_from_train
  train = chose_train
  train&.detach
end

def move_forward
  train = chose_train
  return unless train&.route
  train&.move_forward
end

def move_back
  train = chose_train
  return unless train&.route
  train&.move_back
end

def print_stations_list
  @all_stations.each_with_index do |station, index|
    puts "#{index + 1}. #{station.name}"
  end
end

def print_trains_list
  @all_trains.each_with_index do |train, index|
    puts "#{index + 1}. #{train.number}"
  end
end

def print_trains_list_on_station
  station = @all_stations[chose_station - 1]
  puts station.trains
end

def chose_train
  return no_trains unless @all_trains.any?
  print_trains_list
  puts 'Выберите поезд:'
  choise = gets.to_i
  choise <= @all_trains.size ? @all_trains[choise - 1] : chose_train
end

def chose_station
  print_stations_list
  puts 'Выберите станцию:'
  choise = gets.to_i
  choise <= @all_stations.size ? choise : chose_station
end

main_menu
