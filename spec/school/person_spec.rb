require_relative '../../lib/school/person'

RSpec.describe Person do
  before(:all) do
    @adult = Person.new(23, 'Kelvin')
    @child = Person.new(17, 'John', parent_permission: false)
  end

  context 'when a new person is created' do
    it 'should get the name of the created person' do
      expect(@adult.name).to eq 'Kelvin'
    end
    it 'should not use services if underage and doesn\'t have parent permission' do
      expect(@child.can_use_services?).to eq false
    end
    it 'should have default parent permissions' do
      expect(@adult.parent_permission).to eq true
    end
  end
end
