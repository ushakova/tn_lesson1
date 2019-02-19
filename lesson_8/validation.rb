module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, validation_type, params = nil)
      self.validations ||= []
      self.validations << { name: name,
                            validation_type: validation_type,
                            params: params }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate!
      self.class.validations.each do |validation|
        name = validation[:name]
        current_value = instance_variable_get("@#{name}".to_sym)
        method = "validate_#{validation[:validation_type]}".to_sym
        send(method, name, current_value, validation[:params])
      end
    end

    def validate_presense(name, value, _)
      return unless value.nil? || value.empty?
      raise "#{name} should not be nil or empty"
    end

    def validate_format(name, value, format)
      return if value =~ format
      raise "#{name} has invalid format"
    end

    def validate_type(name, value, type)
      return if value.is_a?(type)
      raise TypeError, "#{name} has invalid type"
    end

    def validate_train_type(name, value, type)
      return if value == type
      raise TypeError, "#{name} has invalid type"
    end
  end
end
