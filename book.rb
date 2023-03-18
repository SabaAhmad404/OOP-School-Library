class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(rental)
    @rental.push(rental)
    rental.book = self
  end
end