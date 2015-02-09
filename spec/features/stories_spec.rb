require 'rails_helper'

RSpec.feature 'Managing Stories' do
  scenario 'list all stories' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    Story.create!(title: 'three blind mice')
    Story.create!(title: 'cats can fly')

    visit '/stories'

    expect(page).to have_content 'Stories'
    expect(page).to have_selector 'li', count: 2

    Warden.test_reset!
  end

  scenario 'Create a new story' do
    User.destroy_all
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit "/stories/new"

    fill_in 'Title', with: 'This be the tale of Davy Jones'

    click_on 'Create Story'

    expect(page).to have_content(/success/i)

    Warden.test_reset!
  end
end
