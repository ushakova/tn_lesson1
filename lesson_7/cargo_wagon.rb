class CargoWagon < Wagon
  attr_reader :volume, :occupied_volume
  def initialize(volume)
    @volume = volume
    @occupied_volume = 0
    validate!
    @type = 'Cargo'
  end

  def occupy_space(sum_volume)
    raise 'Все место занято' if sum_volume > free_volume

    self.occupied_volume += sum_volume
  end

  def free_volume
    volume - occupied_volume
  end

  private

  attr_writer :volume, :occupied_volume

  def validate!
    raise 'Объём должен быть числом' unless volume.class == Integer
    raise 'Объём должен быть положительным числом' unless volume > 0
  end
end
