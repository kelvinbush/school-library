require_relative '../../lib/school/decorator'
require_relative '../../lib/school/person'

RSpec.describe Decorator do
  context 'When testing decorator classes' do
    it 'Should return a capitalized string' do
      person = Person.new(23, 'kelvin')
      cap_person = CapitalizeDecorator.new(person)
      expect(cap_person.correct_name).to eq 'Kelvin'
    end

    it 'Should trim a string to 10 characters' do
      person = Person.new(23, 'capitalized_long_name')
      trim_person = TrimmerDecorator.new(person)
      expect(trim_person.correct_name).to eq 'capitalize'
    end
  end
end
