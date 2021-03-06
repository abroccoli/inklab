require 'rails_helper'

RSpec.describe 'routes for lines' do
  it 'routes GET /stories/:id/lines' do
    expect(get('/stories/1/lines')).to route_to(
      controller: 'lines',
      action: 'index',
      story_id: '1'
      )
  end

   it 'routes GET /stories/:id/lines/new' do
    expect(get('/stories/1/lines/new')).to route_to(
      controller: 'lines',
      action: 'new',
      story_id: '1'
      )
  end

end
