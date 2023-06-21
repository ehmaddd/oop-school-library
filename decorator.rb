# frozen_string_literal: true

require_relative 'nameable'

module DecoratorClass
  include NameableClass
  class Decorator < Nameable
    attr_accessor :component

    def initialize(component)
      super()
      @component = component
    end

    def correct_name
      @component.correct_name
    end
  end
end
