require './book'
require './person'
require './student'
require './teacher'
require './classroom'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "#{person.name} (#{person.class})" }
  end

  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_result = gets.chomp.to_i
    case input_result
    when 1
      print 'Name:'
      name = gets.chomp
      print 'Age:'
      age = gets.chomp
      print 'Has Parent permission? [Y/N]'
      permission = gets.chomp
      student = Student.new(age, name, parent_permission: permission)
      @people.push(student)
      puts 'Student Created Successfully'
    when 2
      print 'Specialization:'
      specialization = gets.chomp
      print 'Age:'
      age = gets.chomp
      print 'Name:'
      name = gets.chomp
      @people << Teacher.new(age, name, specialization: specialization)
      puts 'Teacher Created Successfully'
    end
  end

  def create_book
    puts "Enter the book's title:"
    title = gets.chomp
    puts "Enter the book's author:"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author} has been added to the library."
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
      book_index = gets.chomp.to_i
      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_index = gets.chomp.to_i
      print 'Date: '
      date = gets.chomp
      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      puts 'Rental created successfully'
    end
  end

  def list_rentals_for_person
    print 'ID of person: '
    id = gets.chomp.to_i
    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
