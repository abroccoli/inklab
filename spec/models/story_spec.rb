require 'rails_helper'

RSpec.describe Story, :type => :model do
    let(:valid_attributes) {
    { title: 'This be the tale of Davy Jones'}
  }

  let(:invalid_attributes) {
    { title: nil}
  }

  describe 'compile' do
    it 'creates one paragraph out of all the story lines' do
      story = Story.create!(valid_attributes)
      story.lines.create!(content: 'once upon a time there were three ugly ass mice.')
      story.lines.create!(content: 'They liked to travel around the world.')
      expect(story.compile).to eq 'Once upon a time there were three ugly ass mice. They liked to travel around the world.'
    end
  end

  describe 'last_line' do
    it 'creates one paragraph out of all the story lines' do
      story = Story.create!(valid_attributes)
      story.lines.create!(content: 'once upon a time there were three ugly ass mice.')
      story.lines.create!(content: 'They liked to travel around the world.')
      expect(story.last_line).to eq 'They liked to travel around the world.'
    end
  end
end
