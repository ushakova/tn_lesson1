class CargoTrain < Train
  def initialize(number)
    super(number)
    @wagon_type = CargoWagon
  end
end
