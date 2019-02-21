class Route
  include InstanceCounter
  include Validation

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  attr_accessor :stations
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    validate!
    @stations = [first_station, last_station]
    register_instance
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
end
