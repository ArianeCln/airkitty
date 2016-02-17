class AddAddressToKittens < ActiveRecord::Migration
  def change
    add_column :kittens, :address, :string
  end
end
