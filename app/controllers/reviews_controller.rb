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
      @kitten.average_rating = @kitten.calc_average_rating
      @kitten.save
      respond_to do |format|
        format.html { redirect_to kitten_path(@kitten) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end

    else
      respond_to do |format|
        format.html { render "kittens/show" }
        format.js  # <-- idem
      end
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
