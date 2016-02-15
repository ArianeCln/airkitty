class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.string :race
      t.text :diet
      t.string :personality
      t.boolean :home_delivery
      t.integer :price_per_day
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
