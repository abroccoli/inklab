class StoriesController < ApplicationController
  before_action :authenticate_user!

  def private
    @stories = Story.where(user_id: current_user.id)
  end

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
    @line = @story.lines.new
  end

  def show
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      flash[:success] = 'Story successfully created!'
      redirect_to story_path(@story)
    else
      render :new
    end
  end


  private

  def story_params
    params.require(:story).permit(:title, lines_attributes: [:content]).merge(user_id: current_user.id)
  end
end
