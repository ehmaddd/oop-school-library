require_relative 'nameable'
require_relative 'rental'

module PersonClass
  include NameableClass
  class Person < Nameable
    include RentalClass
    attr_accessor :name, :age
    attr_reader :id, :rentals

    def initialize(age, design, name = 'Unknown', parent_permission: true)
      super()
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @design = design
      @parent_permission = parent_permission
      @rentals = []
    end

    def can_use_services?
      return true if of_age? || parent_permission
    end

    def correct_name=(new_name)
      @name = new_name
    end

    def correct_name
      @name
    end

    def rent_book(book, date)
      Rental.new(date, book, self)
    end

    def to_hash
      {
        id: @id,
        name: @name,
        age: @age,
        design: @design,
        rentals: @rentals.map(&:to_hash)
      }
    end

    private

    def of_age?
      age >= 18
    end
  end
end
