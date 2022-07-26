require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require 'json'
require 'fileutils'
# rubocop:disable Metrics

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @rentals = []
    @books = []
    @people = []
    @books_path = "./../file/books.json"
    @people_path = "./../file/people.json"
    @rentals_path = "./../file/rentals.json"
    initialize_files
  end

  def initialize_files
    FileUtils.touch(@books_path) unless File.exist?(@books_path)
    FileUtils.touch(@people_path) unless File.exist?(@people_path)
    FileUtils.touch(@rentals_path) unless File.exist?(@rentals_path)
  end
  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def add_rental(book, person, date)
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
  end

  def list_rentals(person_id)
    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    if person_rentals.length.positive?
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'The selected person has no rentals'
    end
  end

  def list_people
    if @people.length.positive?
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    else
      puts 'Please add a person first'
    end
  end

  def list_books
    if @books.length.positive?
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    else
      puts 'You have no books added!'
    end
  end

  def save_file
    rentals = JSON.generate(@rentals)
    books = JSON.generate(@books)
    people = JSON.generate(@people)
    File.open(@people_path, "w") { |f| f.write people }
    File.open(@rentals_path, "w") { |f| f.write rentals }
    File.open(@books_path, "w") { |f| f.write books }
  end

  def read_file
    JSON.parse(File.read(@books_path)).each { |book| puts "#{book['@title']} by #{book['@author']}" }
  end

end

# rubocop:enable Metrics
