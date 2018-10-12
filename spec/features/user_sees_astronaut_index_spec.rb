require 'rails_helper'

describe 'user visits astronaut index' do
  it 'should show astronaut attributes' do
    astronaut = Astronaut.create(name: "Nick Lindy", age: 31, job: "Commander")

    visit astronauts_path

    expect(page).to have_content(astronaut.name)
    expect(page).to have_content(astronaut.age)
    expect(page).to have_content(astronaut.job)

  end

  it 'shows avg age for astronauts' do
    astronaut_1 = Astronaut.create(name: "Nick Lindy", age: 40, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Rick Nindy", age: 20, job: "Chef")

    visit astronauts_path

    expect(page).to have_content("Average Age: 30")
  end

  it 'shows missions for astronauts in alpha order' do
    astronaut_1 = Astronaut.create(name: "Nick Lindy", age: 40, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Rick Nindy", age: 20, job: "Chef")
    mission_1 = astronaut_1.missions.create(title: "B Moon", time_in_space: 20)
    mission_2 = astronaut_1.missions.create(title: "A Moon", time_in_space: 30)
    mission_3 = astronaut_2.missions.create(title: "D Mars", time_in_space: 40)
    mission_4 = astronaut_2.missions.create(title: "C Mars", time_in_space: 50)

    visit astronauts_path

    expect(page).to have_content("A Moon B Moon")
    expect(page).to have_content("C Mars D Mars")
  end
end
