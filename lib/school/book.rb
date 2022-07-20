class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @author = author
    @title = title
    @rentals = []
  end
end
