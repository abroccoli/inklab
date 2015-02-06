require 'rails_helper'

RSpec.describe 'routes for stories' do
  it 'routes GET /stories to the stories controller' do
    expect(get('/stories')).to route_to('stories#index')
  end

  it 'routes GET /stories/new to the stories controller' do
    expect(get('/stories/new')).to route_to('stories#new')
  end
end







              #    stories GET    /stories(.:format)             stories#index
              #            POST   /stories(.:format)             stories#create
              #  new_story GET    /stories/new(.:format)         stories#new
              # edit_story GET    /stories/:id/edit(.:format)    stories#edit
              #      story GET    /stories/:id(.:format)         stories#show
              #            PATCH  /stories/:id(.:format)         stories#update
              #            PUT    /stories/:id(.:format)         stories#update
              #            DELETE /stories/:id(.:format)         stories#destroy
