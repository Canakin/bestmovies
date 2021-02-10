class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update]
  def index
    @movies = Movie.all
  end

  def show
    sum = 0
    @movie.reviews.each do |review|
      sum += review.rating.to_i
    end
    if @movie.reviews.length > 0
      @avg_rate = (sum / @movie.reviews.length).to_f
    end
  end

  def top
    @movies = Movie.where('imdb_score > ?', 7.5).sort { |a, b| b <=> a }
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save!
      redirect_to movies_path
    else
      redirect_to new_movie_path
    end
  end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render 'movies/:id/edit'
    end
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :genre, :summary, :imdb_score, :type, :origin, :catego, :languange, :photo)
  end
end
