require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'book'

module AppClass
  class App
    include StudentClass
    include ClassroomClass
    include TeacherClass
    include BookClass
    def initialize
      @people = []
      @books = []
      @rentals = []
    end

    def list_all_books
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end

    def list_all_people
      @people.each do |person|
        puts "[#{person.class.to_s.split('::').last}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
      end
    end

    def create_person
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number] : '
      person_type = gets.chomp.downcase

      print 'Age : '
      age = gets.chomp
      print 'Name : '
      name = gets.chomp

      case person_type
      when '1'
        create_student(name, age)
      when '2'
        create_teacher(name, age)
      else
        puts 'Invalid person type. Person not created.'
      end
    end

    def create_student(name, age)
      print 'Has parent permission? [Y/N] : '
      permission = gets.chomp
      if permission == 'Y'
        student = Student.new(age, 'first', name)
        classroom = Classroom.new('first')
        classroom.add_student(student)
        @people << student
        puts 'Person created successfully.'
      else
        puts 'No permission = No account creation'
      end
    end

    def create_teacher(name, age)
      print 'Enter the specialization : '
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name)
      @people << teacher
      puts 'Person created successfully.'
    end

    def create_book
      print 'Title : '
      title = gets.chomp
      print 'Author : '
      author = gets.chomp

      book = Book.new(title, author)
      @books << book
      puts 'Book created successfully.'
    end

    def select_book
      puts 'Select a book from the following list by number'
      @books.each_with_index { |b, idx| puts "#{idx}) Title: #{b.title}, Author: #{b.author}" }
      number = gets.chomp

      if number.to_i > @books.length - 1
        puts 'Book not found'
        return
      else
        book = @books[number.to_i]
      end
    end

    def select_person
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |p, idx|
        puts "#{idx}) [#{p.class.to_s.split('::').last}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age} "
      end
      person_index = gets.chomp

      if person_index.to_i > @people.length - 1
        puts 'Person not found'
      else
        person = @people[person_index.to_i]
      end
    end

    def create_rental
      book = select_book
      person = select_person

      print 'Date : '
      date = gets.chomp

      rental = person.rent_book(book, date)
      @rentals << rental
      puts 'Rental created successfully.'
    end

    def list_rentals_for_person
      puts 'ID of person : '
      person_id = gets.chomp.to_i

      person = @people.find { |p| p.id == person_id }

      if person.nil?
        puts "Person with ID #{person_id} not found."
      else
        rentals = person.rentals

        if rentals.empty?
          puts 'Rentals :'
        else
          puts 'Rentals :'
          rentals.each do |rental|
            puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
          end
        end
      end
    end
  end
end
