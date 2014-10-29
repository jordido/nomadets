class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def edit
  end

  def index
    @reviews = Review.all
  end

  def show 
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_url
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:author_id, :reviewed_id, :course_id, :comment, :rating)
  end
end
