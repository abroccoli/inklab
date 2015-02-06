require 'rails_helper'

RSpec.describe 'routes for users' do
  it 'routes GET /users to the users controller' do
    expect(get('/users')).to route_to('users#index')
  end
end
