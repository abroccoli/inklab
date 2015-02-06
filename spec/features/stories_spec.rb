require 'rails_helper'

RSpec.feature 'Managing Stories' do
  scenario 'list all stories' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    Story.create!(title: 'three blind mice')
    Story.create!(title: 'cats can fly')

    visit '/stories'

    expect(page).to have_content 'Stories'
    expect(page).to have_selector 'li', count: 2

    Warden.test_reset!
  end

end
