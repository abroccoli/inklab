class LinesController < ApplicationController
  before_action :set_story

  def index
    @lines = @story.lines
  end

  def new
    @line = Line.new
  end

  def create
    @line = @story.lines.build(line_params)

    if @line.save
      flash[:success] = 'Story successfully created.'
      redirect_to story_path(@story)
    else
      render :new
    end
  end


  private

  def line_params
    params.require(:line).permit(:content)
  end

  def set_story
    @story = Story.find(params[:story_id])
  end

end