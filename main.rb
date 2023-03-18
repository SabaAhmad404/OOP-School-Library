require './app'
class Main
  def initialize
    @app = App.new
  end

  def run
    loop do
      display_menu
      choice = gets.chomp
      case choice
      when '1'
        @app.list_books
      when '2'
        @app.list_people
      when '3'
        @app.create_person
      when '4'
        @app.create_book
      when '5'
        @app.create_rental
      when '6'
        @app.list_rentals_for_person
      when '7'
        quit
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  def quit
    puts 'Thank you for using the Library App. Goodbye!'
  end

  def display_menu
    puts 'Library App Menu:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Quit the app'
  end
end

main = Main.new
main.run
