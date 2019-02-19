class PassengerTrain < Train
  validate :number, :format, /^[\w\d]{3}-?[\w\d]{2}$/
  validate :type, :train_type, 'Passenger'

  def initialize(number)
    super(number, 'Passenger')
  end
end
