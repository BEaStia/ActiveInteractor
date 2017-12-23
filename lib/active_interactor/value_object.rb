# frozen_string_literal: true

module ActiveInteractor
  class ValueObject
    attr_accessor :value

    def initialize(value)
      self.value = value
    end

    def call
      value
    end
  end
end
