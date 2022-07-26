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

end
