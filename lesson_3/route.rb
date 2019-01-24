class Route
  attr_accessor :first_station, :last_station, :way_stations
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @way_stations = []
  end

  def add_station(station)
    way_stations << station
  end

  def delete_station(station)
    way_stations.delete(station)
  end

  def print_all_way_stations
    print way_stations
  end
end
