require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    it 'should show avg age for all astronauts' do
      astronaut = Astronaut.create(name: "Nick Lindy", age: 40, job: "Commander")
      astronaut = Astronaut.create(name: "Rick Nindy", age: 20, job: "Chef")
      avgerage_age = Astronaut.avg_age

      expect(avgerage_age).to eq(30)
    end
  end
end
