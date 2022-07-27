require_relative '../../lib/school/classroom'
require_relative '../../lib/school/student'

RSpec.describe Classroom do
  before(:all) do
    @classroom = Classroom.new('Biology')
    @student = Student.new(23, 'John')
  end

  context 'when condition new Classroom is created' do
    it 'should be able to add new student' do
      @student.classroom = @classroom
      expect(@classroom.students.include? @student).to eq true
    end

    it 'should return the correct label' do
      expect(@classroom.label).to eq 'Biology'
    end
  end
end
