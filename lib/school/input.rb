require_relative 'app'

class Input
  def initialize
    @app = App.new
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2). [Input the number]: '
    person_option = gets.chomp.to_i

    if [1, 2].include?(person_option)
      print 'Enter the age:'
      age = gets.chomp
      print 'Enter the name:'
      name = gets.chomp
      if person_option == 1
        print 'Has Parent permission? [Y/N]:'
        permit = gets.chomp
        permission = permit.downcase == 'y'
        @app.create_student(age, name, permission)
      else
        print 'Enter specialization:'
        specialization = gets.chomp
        @app.create_teacher(specialization, age, name)
      end
      puts 'Person created successfully'
    else
      puts 'Invalid option'
      create_person
    end
  end

  def create_book
    print 'Enter the title:'
    title = gets.chomp
    print 'Enter author:'
    author = gets.chomp
    @app.add_book(title, author)
    puts 'Books created successfully'
  end

  def run
    puts 'Welcome to School Library App!'
    display_actions
  end


  def display_actions
    puts 'Please choose an option by entering a number'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals.'
    puts '7. Exit app'

    action_id = gets.chomp
    puts action_id
    execute_app(action_id)
  end

  def execute_app(action_id)
    case action_id
    when '1'
      @app.list_books
    when '2'
      @app.list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      rentals_per_person
    when '7'
      exit
    else
      puts 'Invalid input kindly choose between (1-7)'
    end
    display_actions
  end
end
