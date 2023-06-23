# frozen_string_literal: true

module LibraryClass
  class Library
    attr_reader :books

    def initialize
      @books = []
    end

    def add_book(book)
      @books << book
    end

    def show_all_books
      if @books.empty?
        puts 'The library is empty.'
      else
        puts 'List of books in the library:'
        @books.each do |book|
          puts "Title: #{book.title}, Author: #{book.author}"
        end
      end
    end
  end
end
