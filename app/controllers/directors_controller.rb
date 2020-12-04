class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
    @director = Director.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @director = Director.new(director_params)
    @director.movie = @movie
    if @director.save!
      redirect_to movie_directors_path
    else
      redirect_to new_movie_director_path
    end
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @director = Director.find(params[:id])
    @director.update!(director_params)
    redirect_to movie_directors_path
  end

  private

  def director_params
    params.require(:director).permit(:fullname, :birthyear, :minibio, :nationality, :top_movies, :photo, :movie_id)
  end
end
