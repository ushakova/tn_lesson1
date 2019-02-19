class Station
  include InstanceCounter
  include Validation

  attr_accessor :trains, :name
  validate :name, :format, /^[\w\d]+/

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@all_stations << self
    register_instance
    puts "Создана станция  #{name}"
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

  def each_train
    trains.each_with_index do |train, index|
      print "#{index + 1}. "
      yield train
    end
  end
end
