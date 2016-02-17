class AddCoordinatesToKittens < ActiveRecord::Migration
  def change
    add_column :kittens, :latitude, :float
    add_column :kittens, :longitude, :float
  end
end
