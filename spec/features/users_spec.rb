require 'rails_helper'

# RSpec.feature 'Managing Users' do
#   scenario 'list all users' do
#     User.create!(email: 'something@fake.com', password: 'patriots')
#     User.create!(email: 'somethingelse@fake.com', password: 'patriots')

#     visit '/users'

#     expect(page).to have_content 'Users'
#     expect(page).to have_selector 'li', count: 2
#   end

#   scenario 'register a new user' do
#     visit '/users/new'

#     fill_in 'Email', with: 'somedude@aplace.com'
#     fill_in 'Password', with: "ieatboogers"
#     click_on 'Register'

#     expect(page).to have_content(/success/i)
#   end
# end
