require_relative '../../lib/school/student'

RSpec.describe Student do
  before(:all) do
    @student = Student.new(20, 'Adam')
  end

  context 'when condition new student is created' do
    it 'should be of Student class' do
      expect(@student.is_a? Student).to eq true
    end

    it 'should play hooky' do
      expect(@student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
