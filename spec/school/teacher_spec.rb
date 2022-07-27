require_relative '../../lib/school/teacher'

RSpec.describe 'Teacher' do
  before(:all) do
    @teacher = Teacher.new('Physics', 43, 'Tom')
  end

  context 'when condition a new Teacher is created' do
    it 'should get specialization' do
      expect(@teacher.specialization).to eq 'Physics'
    end

    it 'should always use services' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
