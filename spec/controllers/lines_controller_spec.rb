require 'rails_helper'

RSpec.describe LinesController do

    let(:valid_attributes) {
    { title: 'This be the tale of Davy Jones'}
  }

  let(:invalid_attributes) {
    { title: nil}
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      story = Story.create!(valid_attributes)
      get :index, story_id: story.id
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      story = Story.create!(valid_attributes)
      get :index, story_id: story.id
      expect(response).to render_template('index')
    end

    it 'assigns @lines' do
      story = Story.create!(valid_attributes)
      lines = story.lines
      get :index, story_id: story.id
      expect(assigns(:lines)).to eq lines
    end
  end
end
