class StarsController < ApplicationController
  before_action :find_stars, only: [:show]

  def index
    @stars = Star.all
  end

  def show;
  end

  def new
    @star = Star.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @star = Star.new(star_params)
    @star.movie = @movie
    if @star.save!
      redirect_to movie_stars_path
    else
      redirect_to new_movie_star_path
    end
  end

  def edit
    @star = Star.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @star = Star.find(params[:id])
    @star.update!(star_params)
    redirect_to movie_stars_path
  end

  private

  def find_stars
    @star = Star.find(params[:id])
  end

  def star_params
    params.require(:star).permit(:fullname, :birthyear, :minibio, :nationality, :top_movies, :height, :photo, :movie_id)
  end
end
