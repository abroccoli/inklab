require 'rails_helper'

RSpec.feature 'Managing Story Lines' do
  scenario 'list all Lines for a Story' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    story1 = Story.create!(title: 'three blind mice')
    story2 = Story.create!(title: 'cats can fly')

    story1.lines.create!(content: 'once upon a time there were three ugly ass mice.')
    story1.lines.create!(content: 'Who liked to travel around the world.')
    story2.lines.create!(content: 'Cats are already crazy, now they are even more nuts.')

    visit "/stories/#{story1.id}/lines"

    expect(page).to have_content "#{story1.lines[0].content}"

    Warden.test_reset!
  end

  scenario 'Create a new line' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    story1 = Story.create!(title: 'three blind mice')
    story2 = Story.create!(title: 'cats can fly')

    story1.lines.create!(content: 'once upon a time there were three ugly ass mice.')
    story1.lines.create!(content: 'Who liked to travel around the world.')
    story2.lines.create!(content: 'Cats are already crazy, now they are even more nuts.')

    visit "/stories/#{story1.id}/lines/new"

    fill_in 'Content', with: 'The honey badger is a pretty sweet animal'

    click_on 'Add Line'

    expect(page).to have_content(/success/i)

    Warden.test_reset!
  end

  scenario 'join all lines into one paragraph' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    story1 = Story.create!(title: 'three blind mice')
    story2 = Story.create!(title: 'cats can fly')

    story1.lines.create!(content: 'once upon a time there were three ugly ass mice.')
    story1.lines.create!(content: 'Who liked to travel around the world.')
    story2.lines.create!(content: 'Cats are already crazy, now they are even more nuts.')

    visit "/stories/#{story1.id}"

    expect(page).to have_selector 'p', count: 1

    Warden.test_reset!
  end
end
