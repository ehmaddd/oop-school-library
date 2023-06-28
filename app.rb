require 'json'
require_relative 'library'
require_relative 'preserve_data'

module AppClass
  class App
    include LibraryClass
    include PreserveDataModule
    def initialize
      books = restore_books
      members = restore_members
      @library = Library.new(books, members)
    end

    def list_all_books
      @library.display_all_books
    end

    def list_all_people
      @library.display_all_members
    end

    def create_person
      @library.create_member
    end

    def create_book
      @library.add_book
    end

    def select_book
      @library.get_book
    end

    def select_person
      @library.get_person
    end

    def create_rental
      @library.generate_rental
    end

    def exit_app
      puts 'Thank you for using this app!'
      exit
    end

    def list_rentals_for_person
      @library.display_individual_rental
    end
  end
end
