class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user
    if @review.save!
      redirect_to movie_path(@movie)
    else
      redirect_to movie_reviews_path
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    if @review.update!(review_params)
      redirect_to movie_path(@movie)
    else
      redirect_to edit_movie_review_path
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :movie_id)
  end
end
