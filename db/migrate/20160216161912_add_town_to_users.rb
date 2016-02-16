class AddTownToUsers < ActiveRecord::Migration
  def change
    add_column :users, :town, :string
  end
end
