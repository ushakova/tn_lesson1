class Train
  attr_accessor :speed, :number_of_cars, :route,
                :current_station, :current_station_index
  def initialize(number, type, number_of_cars)
    @number = number
    @type = type
    @number_of_cars = number_of_cars
    @speed = 0
  end

  def gain_speed
    self.speed = speed + 10
  end

  def slow_down
    self.speed = 0
  end

  def attach_the_car
    return unless not_moving?

    self.number_of_cars = number_of_cars + 1
  end

  def detach_the_car
    return unless not_moving? || number_of_cars.zero?

    self.number_of_cars = number_of_cars - 1
  end

  def take_route(route)
    self.route = route
    self.current_station_index = 0
    self.current_station = route.stations.first
    current_station.take_train(self)
  end

  def next_station
    return unless route

    route.stations[next_index]
  end

  def previous_station
    return unless route

    route.stations[previos_index]
  end

  def move_back
    return if current_station_index.zero?

    self.current_station = previous_station
    self.current_station_index = previos_index
  end

  def move_forward
    return if current_station_index == route.stations.size - 1

    self.current_station = next_station
    self.current_station_index = next_index
  end

  private

  def not_moving?
    speed.zero?
  end

  def next_index
    current_station_index + 1
  end

  def previos_index
    current_station_index - 1
  end
end
