class Route
  attr_accessor :stations
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def print_all_way_stations
    stations.each_with_index { |station, index| puts "#{index + 1}. #{station.name}" }
  end
end
