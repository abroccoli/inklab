require 'rails_helper'

RSpec.describe StoriesController do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @stories' do
      stories = Story.all
      get :index
      expect(assigns(:stories)).to eq stories
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @story' do
      get :new
      expect(assigns(:story)).to be_a_new Story
    end
  end




end
