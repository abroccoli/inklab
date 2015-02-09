require 'rails_helper'

RSpec.feature 'Managing Users' do
  scenario 'list all stories for a User' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    story1 = Story.create!(title: 'three blind mice')
    story2 = Story.create!(title: 'cats can fly')

    story1.lines.create!(content: 'once upon a time there were three ugly ass mice.')
    story1.lines.create!(content: 'Who liked to travel around the world.')
    story2.lines.create!(content: 'Cats are already crazy, now they are even more nuts.')

    visit "/users/#{user.id}/stories"

    expect(page).to have_content "#{story1.title}"

    Warden.test_reset!
  end
end
