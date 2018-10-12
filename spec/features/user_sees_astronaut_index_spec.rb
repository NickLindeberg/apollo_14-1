require 'rails_helper'

describe 'user visits astronaut index' do
  it 'should show astronaut attributes' do
    astronaut = Astronaut.create(name: "Nick Lindy", age: 31, job: "Commander")

    visit astronauts_path

    expect(page).to have_content(astronaut.name)
    expect(page).to have_content(astronaut.age)
    expect(page).to have_content(astronaut.job)

  end
end
