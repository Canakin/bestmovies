class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact]

  def home
  end

  def contact
  end

  def dashboard
    @reviews = Review.all
    @posts = Post.all
  end
end
