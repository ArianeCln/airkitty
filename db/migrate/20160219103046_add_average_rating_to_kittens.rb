class AddAverageRatingToKittens < ActiveRecord::Migration
  def change
    add_column :kittens, :average_rating, :float
  end
end
