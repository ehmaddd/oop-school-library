require_relative 'app'

module MainApp
  class Main
    include AppClass

    def show_options
      puts "\nPlease choose an option by entering a number : "
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
    end

    def apply_case(choice, app)
      case_actions = {
        1 => :list_all_books,
        2 => :list_all_people,
        3 => :create_person,
        4 => :create_book,
        5 => :create_rental,
        6 => :list_rentals_for_person,
        7 => :exit_app
      }
      action = case_actions[choice]
      if action
        app.send(action)
      else
        puts 'Invalid option. Please try again.'
      end
    end


    def show_menu
      app = App.new
      loop do
        show_options

        choice = gets.chomp.to_i
        apply_case(choice, app)
      end
    end
  end

  puts 'Welcome to School Library App!'
  main = Main.new
  main.show_menu
end
