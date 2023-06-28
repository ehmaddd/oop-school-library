require_relative 'rental'

module BookClass
  class Book
    include RentalClass
    attr_accessor :title, :author
    attr_reader :rentals

    def initialize(title, author)
      @title = title
      @author = author
      @rentals = []
    end

    def to_hash
      {
        title: @title,
        author: @author,
        rentals: @rentals.map(&:to_hash)
      }
    end
  end
end
