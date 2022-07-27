require_relative '../../lib/school/teacher'
require_relative '../../lib/school/book'
require_relative '../../lib/school/rental'
RSpec.describe Rental do
  before(:all) do
    @person = Teacher.new('Biology', 54, 'Tom')
    @book = Book.new('Goat Matata', 'Ken Walibora')
    @date = '2022/07/27'
    @rental = Rental.new(@date, @person, @book)
  end

  context 'when condition date, person and book given' do
    it 'should create a rental' do
      expect(@rental.is_a?(Rental)).to eq true
    end

    it 'should get correct person of given person' do
      expect(@rental.person.name).to eq 'Tom'
    end

    it 'should get correct person of given book' do
      expect(@rental.book.title).to eq 'Goat Matata'
    end
  end
end
