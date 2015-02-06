require 'rails_helper'

RSpec.feature 'Managing Users' do
  scenario 'list all users' do
    User.create!(email: 'something@fake.com', password: 'patriots')
    User.create!(email: 'somethingelse@fake.com', password: 'patriots')

    visit '/users'

    expect(page).to have_content 'Users'
    expect(page).to have_selector 'li', count: 2
  end
end
