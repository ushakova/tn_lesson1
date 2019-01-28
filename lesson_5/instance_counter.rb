module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    private

    def register_instance
      counter = self.class.instances || 0
      self.class.instances = counter + 1
    end
  end

  module ClassMethods
    attr_accessor :instances
  end
end
