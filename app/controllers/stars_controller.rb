class StarsController < ApplicationController
  def index
    @stars = Star.all
  end

  def show
    @star = Star.find(params[:id])
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

  def star_params
    params.require(:star).permit(:fullname, :birthyear, :minibio, :nationality, :top_movies, :height, :photo, :movie_id)
  end
end