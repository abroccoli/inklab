require 'rails_helper'

RSpec.describe LinesController do

  let(:valid_attributes) {
    { title: 'This be the tale of Davy Jones'}
  }

  let(:invalid_attributes) {
    { title: nil}
  }

  let(:valid_line){
    {content: "yeah valid brah"}
  }

  let(:invalid_line){
    {content: nil}
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

  describe 'GET new' do
    it 'has a 200 status code' do
      story = Story.create!(valid_attributes)
      get :new, story_id: story.id
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      story = Story.create!(valid_attributes)
      get :new, story_id: story.id
      expect(response).to render_template('new')
    end

    it 'assigns @line' do
      story = Story.create!(valid_attributes)
      lines = story.lines
      get :new, story_id: story.id
      expect(assigns(:line)).to be_a_new Line
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new line' do
        story = Story.create!(valid_attributes)
        expect {
          post :create, line: valid_line, story_id: story.id
        }.to change(Line, :count).by 1
      end
      it 'assigns @line' do
        story = Story.create!(valid_attributes)
        post :create, line: valid_line, story_id: story.id
        expect(assigns(:line)).to be_a Line
        expect(assigns(:line)).to be_persisted
      end

      it 'redirects to the created story' do
          story = Story.create!(valid_attributes)
          post :create, line: valid_line, story_id: story.id
          expect(response).to redirect_to(story_lines_path(story))
      end
    end

    context 'with invalid attributes' do
      it 'assigns @line, but doesnt not save a new line' do
        story = Story.create!(valid_attributes)
        post :create, line: invalid_line, story_id: story.id
        expect(assigns(:line)).to be_a Line
      end

      it 're-renders the new template' do
        story = Story.create!(valid_attributes)
        post :create, line: invalid_line, story_id: story.id
        expect(response).to render_template 'new'
      end
    end
  end
end
