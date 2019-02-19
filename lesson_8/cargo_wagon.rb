class CargoWagon < Wagon
  include Validation

  attr_reader :volume, :occupied_volume
  validate :volume, :type, Integer

  def initialize(volume)
    @volume = volume
    @occupied_volume = 0
    validate!
    @type = 'Cargo'
  end

  def occupy_space(sum_volume)
    raise 'Всё место занято' if sum_volume > free_volume

    self.occupied_volume += sum_volume
  end

  def free_volume
    volume - occupied_volume
  end

  private

  attr_writer :volume, :occupied_volume
end
