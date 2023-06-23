require_relative 'app'

def show_menu
  include AppClass
  app = App.new
  loop do
    puts "\nPlease choose an option by entering a number : "
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_for_person
    when 7
      puts 'Thank you for using this app!'
      exit
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

def run
  puts 'Welcome to School Library App!'
  show_menu
end

run
