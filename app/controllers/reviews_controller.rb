class ReviewsController < ApplicationController
  before_action :set_kitten

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.rating = params[:rating]
    @review.kitten = @kitten
    if @review.save
      redirect_to kitten_path(@kitten)
    else
      render "kittens/show"
    end
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:kitten_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
