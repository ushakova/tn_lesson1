class PassengerTrain < Train
  def initialize(number)
    super(number)
    @wagon_type = PassengerWagon
  end
end
