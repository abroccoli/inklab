require 'rails_helper'

RSpec.describe StoriesController do

    let(:valid_attributes) {
    { title: 'This be the tale of Davy Jones'}
  }

  let(:invalid_attributes) {
    { title: nil}
  }




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

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new story' do
        expect {
          post :create, story: valid_attributes
        }.to change(Story, :count).by 1
      end

      it 'assigns @story' do
        post :create, story: valid_attributes
        expect(assigns(:story)).to be_an Story
        expect(assigns(:story)).to be_persisted
      end

      it 'redirects to the created story' do
        post :create, story: valid_attributes
        expect(response).to redirect_to(Story.last)
      end
    end

    context 'with invalid attributes' do
      it 'assigns @story, but does not save a new story' do
        post :create, story: invalid_attributes
        expect(assigns(:story)).to be_a_new Story
      end

      it 're-renders the new template' do
        post :create, story: invalid_attributes
        expect(response).to render_template 'new'
      end
    end
  end
end
