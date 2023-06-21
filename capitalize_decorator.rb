# frozen_string_literal: true

require_relative 'decorator'

module CapitalizeDecoratorClass
  include DecoratorClass
  class CapitalizeDecorator < Decorator
    def correct_name
      @component.correct_name.capitalize
    end
  end
end
