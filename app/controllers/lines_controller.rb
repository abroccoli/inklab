class LinesController < ApplicationController
  before_action :set_story

  def index
    @lines = @story.lines
  end

  private

  def set_story
    @story = Story.find(params[:story_id])
  end

end
