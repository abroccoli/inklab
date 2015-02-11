require 'byebug'
class LinesController < ApplicationController
  before_action :set_story

  def index
    @lines = @story.lines
  end

  def new
    @line = Line.new
  end

  def create
    # binding.byebug
    @line = @story.lines.new(line_params)

    if @line.save
      flash[:success] = 'Story successfully created.'
      redirect_to story_path(@story)
    else
      render :new
    end
  end


  private

  def line_params
    params.require(:line).permit(:content).merge(user_id: current_user.id)
  end

  def set_story
    @story = Story.find(params[:story_id])
  end

end
