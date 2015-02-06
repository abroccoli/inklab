require 'rails_helper'

RSpec.feature 'Managing Story Lines' do
  scenario 'list all Lines for a Story' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    story1 = Story.create!(title: 'three blind mice', entries: [])
    story2 = Story.create!(title: 'cats can fly', entries: [])

    story1.entries << Line.create!(content: 'once upon a time there were three ugly ass mice.').to_s
    story1.entries << Line.create!(content: 'Who liked to travel around the world.').to_s
    story2.entries << Line.create!(content: 'Cats are already crazy, now they are even more nuts.').to_s

    visit "/stories/#{story1.id}/lines"

    expect(page).to have_content "#{story1.line[0]}"

    Warden.test_reset!
  end


end
