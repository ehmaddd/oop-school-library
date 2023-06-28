require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'preserve_data'

module LibraryClass
  class Library
    include BookClass
    include StudentClass
    include ClassroomClass
    include PreserveDataModule
    include TeacherClass

    attr_reader :books

    def initialize(books)
      @members = []
      @books = books
      @rentals = []
    end

    def add_book
      print 'Title : '
      title = gets.chomp
      print 'Author : '
      author = gets.chomp

      book = Book.new(title, author)
      if !@books
        @books = []
      end
      @books << book
      preserve_book(@books.map(&:to_hash))
      puts 'Book created successfully.'
    end

    def get_book
      puts 'Select a book from the following list by number'
      @books.each_with_index { |b, idx| puts "#{idx}) Title: #{b.title}, Author: #{b.author}" }
      number = gets.chomp

      if number.to_i > @books.length - 1
        puts 'Book not found'
      else
        @books[number.to_i]
      end
    end

    def get_person
      puts 'Select a person from the following list by number (not id)'
      @members.each_with_index do |p, idx|
        puts "#{idx}) [#{p.class.to_s.split('::').last}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age} "
      end
      person_index = gets.chomp

      if person_index.to_i > @people.length - 1
        puts 'Person not found'
      else
        @members[person_index.to_i]
      end
    end

    def display_all_books
      @books = restore_books
      if @books
        if @books.empty?
          puts 'The library is empty.'
        else
          @books.each do |book|
            puts "Title: \"#{book["title"]}\", Author: #{book["author"]}"
          end
        end
      end
    end

    def create_member
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
        @members << student
        preserve_member(@members.map(&:to_hash))
        puts 'Person created successfully.'
      else
        puts 'No permission = No account creation'
      end
    end

    def create_teacher(name, age)
      print 'Enter the specialization : '
      specialization = gets.chomp

      teacher = Teacher.new(age, specialization, name)
      @members << teacher
      preserve_member(@members.map(&:to_hash))
      puts 'Person created successfully.'
    end

    def display_all_members
      @members = restore_members
      if @members
        @members.each do |member|
          puts "#{member["design"]} Name: #{member["name"]}, ID: #{member["id"]}, Age: #{member["age"]} "
        end
      end
    end

    def generate_rental
      book = select_book
      person = select_person

      print 'Date : '
      date = gets.chomp

      rental = person.rent_book(book, date)
      @rentals << rental
      puts 'Rental created successfully.'
    end

    def display_individual_rental
      puts 'ID of person : '
      member_id = gets.chomp.to_i

      member = @members.find { |p| p["id"] == member_id }

      if member.nil?
        puts "Member with ID #{member_id} not found."
      else
        rentals = member.rentals

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
