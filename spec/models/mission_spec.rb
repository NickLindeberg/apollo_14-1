require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'class methods' do
    it 'should sort missions by alpha' do
      astronaut_1 = Astronaut.create(name: "Nick Lindy", age: 40, job: "Commander")
      mission_1 = astronaut_1.missions.create(title: "B Moon", time_in_space: 20)
      mission_2 = astronaut_1.missions.create(title: "A Moon", time_in_space: 30)
      alpha_sort = Mission.alpha_sort

      expect(alpha_sort).to eq([mission_2, mission_1])
    end
  end
end
