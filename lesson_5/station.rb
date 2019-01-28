class Station
  include InstanceCounter

  attr_accessor :trains, :name
  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def self.all
    @@all_stations
  end

  def take_train(train)
    trains << train
  end

  def get_train_away(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |t| t.type == type }
  end
end
