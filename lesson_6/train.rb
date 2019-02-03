class Train
  include Manufacturer
  include InstanceCounter

  attr_reader :speed, :route, :current_station, :wagons, :number, :type
  @@all_trains = {}

  def initialize(number)
    @number = number.to_s
    @wagons = []
    @speed = 0
    @@all_trains[@number] = self
    validate!
    register_instance
    puts "Создан поезд с номером #{number}"
  end

  def valid?
    number_format_valid?
  end

  def self.find(number)
    @@all_trains[number]
  end

  def gain_speed
    self.speed = speed + 10
  end

  def slow_down
    self.speed = 0
  end

  def attach(wagon)
    return unless not_moving? || wagon.type == type

    wagons << wagon
  end

  def detach
    return unless not_moving? || wagons.empty?

    wagons.pop
  end

  def take_route(route)
    self.route = route
    self.current_station_index = 0
    self.current_station = route.stations.first
    current_station.take_train(self)
  end

  def move_back
    return if current_station_index.zero?

    current_station.get_train_away(self)
    previous_station.take_train(self)
    self.current_station = previous_station
    self.current_station_index = previos_index
  end

  def move_forward
    return if current_station_index == route.stations.size - 1

    current_station.get_train_away(self)
    next_station.take_train(self)
    self.current_station = next_station
    self.current_station_index = next_index
  end

  protected

  attr_reader :current_station_index
  attr_writer :current_station_index, :current_station, :wagons, :type, :route

  def validate!
    raise 'Невалидный формат номера' unless number_format_valid?
  end

  def number_format_valid?
    number =~ /^[\w\d]{3}-?[\w\d]{2}$/
  end

  def not_moving?
    speed.zero?
  end

  def next_index
    current_station_index + 1
  end

  def previos_index
    current_station_index - 1
  end

  def next_station
    return unless route

    route.stations[next_index]
  end

  def previous_station
    return unless route

    route.stations[previos_index]
  end
end
