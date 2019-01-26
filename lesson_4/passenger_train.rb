class PassengerTrain < Train
  def initialize(number)
    super(number)
    @type = 'Passenger'
  end
end
