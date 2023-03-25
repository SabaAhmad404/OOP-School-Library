require './app'
require './display'
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
end

main = Main.new
main.run
