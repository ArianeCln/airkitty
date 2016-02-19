class PagesController < ApplicationController
  def home
    @top_three_cats = Kitten.where.not(average_rating: nil)
    @top_three_cats = @top_three_cats.order(average_rating: :desc).first(3)
  end
end
