class ReviewsController < ApplicationController

  before_action :load_user, only: [:show_by]

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

  def show_by 
    @reviews = @user.reviews_by
    render :index
  end

  def show_for 
    @reviews = @user.reviews_to
    render :index
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to :back
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
  def load_user
    @user = User.find(params[:id])
  end
end
