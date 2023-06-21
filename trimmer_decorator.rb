require_relative 'decorator'

module TrimmerDecoratorClass
  include DecoratorClass
  class TrimmerDecorator < Decorator
    def correct_name
      return @component.correct_name.slice(0, 9) if @component.correct_name.length > 10

      @component.correct_name
    end
  end
end
