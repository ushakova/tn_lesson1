class Route
  include InstanceCounter

  attr_accessor :stations
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    register_instance
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def print_all_way_stations
    stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end
  end

  private

  attr_reader :first_station, :last_station

  def validate!
    return if station?(first_station) && station?(last_station)

    raise 'Маршрут должен содержать начальную и конечную станцию'
  end

  def station?(station)
    station.class == Station
  end
end
