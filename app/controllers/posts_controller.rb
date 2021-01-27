class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @post = Post.new(post_params)
    @post.forum = @forum
    @post.user = current_user
    if @forum.save!
      redirect_to forum_path(@forum)
    else
      redirect_to new_forum_post_path
    end
  end

  def edit; end

  def update
    @forum = Forum.find(params[:forum_id])
    @post.update(post_params)
    redirect_to forum_path(@forum)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :forum_id)
  end
end
