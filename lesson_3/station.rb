
class Station
  attr_accessor :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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
