class StoriesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
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
    params.require(:story).permit(:title)
  end
end
