class ForumsController < ApplicationController
  before_action :find_forum, only: [:show]

  def index
    @forums = Forum.all
  end

  def show; end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    if @forum.save!
      redirect_to forums_path
    else
      redirect_to new_forum_path
    end
  end

  private

  def find_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:title, :description)
  end
end
