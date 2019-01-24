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
    return unless not_moving?

    self.number_of_cars = number_of_cars - 1
  end

  def take_route(route)
    self.route = route
    self.current_station_index = 0
    self.current_station = route.first_station
    current_station.take_train(self)
  end

  def next_station
    route.stations[current_station_index + 1]
  end

  def previous_station
    route.stations[current_station_index - 1]
  end

  def move_back
    self.current_sation = previous_station
    self.current_station_index = current_station_index - 1
  end

  def move_forward
    self.current_sation = next_station
    self.current_station_index = current_station_index + 1
  end

  private

  def not_moving?
    speed.zero?
  end
end
