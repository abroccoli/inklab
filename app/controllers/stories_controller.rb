class StoriesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end
end
