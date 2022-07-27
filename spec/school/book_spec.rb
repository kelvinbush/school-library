require_relative '../../lib/school/book'

RSpec.describe Book do
  before(:all) do
    @book = Book.new('Goat Matata', 'Ken Walibora')
  end
  context 'when condition new book is created' do
    it 'should be of book instance' do
      expect(@book.is_a? Book).to eq true
    end

    it 'should have the correct author' do
      expect(@book.author).to eq 'Ken Walibora'
    end

    it 'should have the correct title' do
      expect(@book.title).to eq 'Goat Matata'
    end
  end
end
